require 'bookmark'

describe Bookmark do
  it 'contains an array on creation' do
    expect(Bookmark.all).to eq([])
  end
  it 'can store instances of bookmark' do
    bookmark = Bookmark.new
    expect(Bookmark.all).to eq([bookmark])
  end
end
