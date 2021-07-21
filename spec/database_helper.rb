require 'pg'

def clear_test_bookmarks_table
  con = PG.connect dbname: 'bookmark_manager_test'
  con.exec 'TRUNCATE TABLE bookmarks;'
end

def populate_test_bookmarks_table
  Bookmark.create('Reddit', 'https://www.reddit.com')
  Bookmark.create('Twitch', 'https://www.twitch.tv')
  Bookmark.create('Google', 'https://www.google.com')
end
