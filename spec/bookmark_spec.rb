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
    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq select_by_id(bookmark.id).first['id']
    expect(bookmark.title).to eq 'Github'
    expect(bookmark.url).to eq 'https://github.com/'
  end
  it 'deletes bookmark' do
    bookmark = Bookmark.create('Github', 'https://github.com/')
    Bookmark.delete(bookmark.id)
    expect(select_by_id(bookmark.id).ntuples).to eq 0
    expect(Bookmark.all.length).to eq 0
  end
end
