require 'bookmark'

describe Bookmark do
  before(:each) do
    populate_test_bookmarks_table
  end
  it 'contains an array on creation' do
    expect(Bookmark.all).to be_an_instance_of(Array)
  end
  it 'returns urls from database' do
    bookmark_list = Bookmark.all
    expect(bookmark_list).to include('http://www.reddit.com')
    expect(bookmark_list).to include('http://www.twitch.tv')
    expect(bookmark_list).to include('http://www.soundcloud.com')
  end
end
