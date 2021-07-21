require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def self.all
    con = if ENV['RACK_ENV'] == 'test'
            PG.connect dbname: 'bookmark_manager_test'
          else
            PG.connect dbname: 'bookmark_manager'
          end
    bookmark_list = con.exec('SELECT * FROM bookmarks')
    bookmark_list.map do |bookmark|
      Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
    end
  rescue PG::Error => e
    puts e.message
  ensure
    bookmark_list&.clear
    con&.close
  end

  def self.create(title, url)
    con = if ENV['RACK_ENV'] == 'test'
            PG.connect(dbname: 'bookmark_manager_test')
          else
            PG.connect(dbname: 'bookmark_manager')
          end

    new_bookmark = con.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, title, url;")
    Bookmark.new(new_bookmark[0]['id'], new_bookmark[0]['title'], new_bookmark[0]['url'])
  end

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end
end
