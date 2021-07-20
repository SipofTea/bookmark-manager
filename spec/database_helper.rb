require 'pg'

def clear_test_bookmarks_table
  con = PG.connect dbname: 'bookmark_manager_test'
  con.exec 'TRUNCATE TABLE bookmarks;'
end

def populate_test_bookmarks_table
  Bookmark.create('http://www.reddit.com')
  Bookmark.create('http://www.twitch.tv')
  Bookmark.create('http://www.soundcloud.com')
end
