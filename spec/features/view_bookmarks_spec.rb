feature 'view list of bookmarks' do
  before(:each) do
    populate_test_bookmarks_table
  end

  scenario 'displays content to /bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'Bookmark 1'
  end

  scenario 'displays a list of bookmarks to /bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'http://www.reddit.com'
    expect(page).to have_content 'http://www.twitch.tv'
    expect(page).to have_content 'http://www.soundcloud.com'
  end
end
