require 'pg'

def clear_test_bookmarks_table
  con = PG.connect dbname: 'bookmark_manager_test'
  con.exec 'TRUNCATE TABLE bookmarks;'
end

def populate_test_bookmarks_table
  con = PG.connect dbname: 'bookmark_manager_test'
  con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.reddit.com');"
  con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.twitch.tv');"
  con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.soundcloud.com');"
end
