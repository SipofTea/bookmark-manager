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
    expect(page).to have_link 'Github', href: 'https://www.github.com'
    click_button('Delete Github')
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link 'Reddit', href: 'https://www.reddit.com'
    expect(page).to have_link 'Twitch', href: 'https://www.twitch.tv'
    expect(page).to have_link 'Google', href: 'https://www.google.com'
    expect(page).not_to have_link 'Github', href: 'https://www.github.com'
  end

  scenario 'updated bookmark shows new information' do
    Bookmark.create('Github', 'https://www.github.com')
    visit('/bookmarks')
    expect(page).to have_link 'Github', href: 'https://www.github.com'
    click_button('Update Github')
    expect(page).not_to have_link 'Reddit', href: 'https://www.reddit.com'
  end
end
