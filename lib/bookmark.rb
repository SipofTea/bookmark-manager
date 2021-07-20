require 'pg'

class Bookmark
  def self.all
    con = if ENV['RACK_ENV'] == 'test'
            PG.connect dbname: 'bookmark_manager_test'
          else
            PG.connect dbname: 'bookmark_manager'
          end

    bookmark_list = con.exec 'SELECT (url) FROM bookmarks;'
    bookmark_array = []
    bookmark_list.each do |row|
      bookmark_array << row['url']
    end
    bookmark_array
  rescue PG::Error => e
    puts e.message
  ensure
    bookmark_list.clear if bookmark_list
    con.close if con
  end
end
