feature 'Edit bookmark' do
  scenario 'editing form is displayed' do
    bookmark = Bookmark.create('Github', 'https://www.github.com')
    visit('/bookmarks/' + bookmark.id + '/edit')
    expect(page).to have_field('bookmark_name', type: 'text')
    expect(page).to have_field('bookmark', type: 'url')
    expect(page).to have_button('save')
  end
end
