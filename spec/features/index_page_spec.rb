feature 'Display homepage' do
  scenario 'shows basic content' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end