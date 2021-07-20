feature 'Create bookmarks' do
  before(:each) do
    populate_test_bookmarks_table
  end
  scenario 'bookmark adding form is displayed' do
    visit('/bookmarks/new')
    expect(page).to have_field('bookmark', type: 'url')
    expect(page).to have_button('save')
  end
  scenario 'user can save bookmark' do
    visit('/bookmarks/new')
    fill_in 'bookmark', with: 'https://github.com/'
    click_button('save')
    expect(page).to have_content 'https://github.com/'
  end
end
