feature 'view list of bookmarks' do
  before(:each) do
    populate_test_bookmarks_table
  end

  scenario 'displays content to /bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'Bookmark List'
  end

  scenario 'displays a list of bookmarks with links to /bookmarks' do
    visit('/bookmarks')
    expect(page).to have_link 'Reddit', href: 'https://www.reddit.com'
    expect(page).to have_link 'Twitch', href: 'https://www.twitch.tv'
    expect(page).to have_link 'Google', href: 'https://www.google.com'
  end

  scenario 'deleted bookmark is not displayed' do
    Bookmark.create('Github', 'https://www.github.com')
    visit('/bookmarks')
    expect(page).to have_link 'Reddit', href: 'https://www.reddit.com'
    click_button('Delete Reddit')
    expect(page).not_to have_link 'Reddit', href: 'https://www.reddit.com'
  end
end
