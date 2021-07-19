feature 'view list of bookmarks' do
  scenario 'displays content to /bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'Bookmark 1'
  end

  scenario 'displays a list of bookmarks to /bookmarks' do
    bookmark_array = %w[bookmark bookmark bookmark]
    allow(Bookmark).to receive(:all).and_return(bookmark_array)
    visit('/bookmarks')
    expect(page).to have_content bookmark_array
  end
end
