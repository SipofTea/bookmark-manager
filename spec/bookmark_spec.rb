require 'bookmark'

describe Bookmark do
  it 'contains an array on creation' do
    expect(Bookmark.all).to be_an_instance_of(Array)
  end
  it 'returns bookmark_list from database' do
    bookmark = Bookmark.create('Reddit', 'https://www.reddit.com')
    Bookmark.create('Twitch', 'https://www.twitch.tv')
    Bookmark.create('Soundcloud', 'https://www.soundcloud.com')
    bookmark_list = Bookmark.all

    expect(bookmark_list.length).to eq 3
    expect(bookmark_list.first).to be_a Bookmark
    expect(bookmark_list.first.id).to eq bookmark.id
    expect(bookmark_list.first.title).to eq 'Reddit'
    expect(bookmark_list.first.url).to eq 'https://www.reddit.com'
  end
  it 'saves a bookmark to the database' do
    bookmark = Bookmark.create('Github', 'https://github.com/')
    persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.title).to eq 'Github'
    expect(bookmark.url).to eq 'https://github.com/'
  end
end
