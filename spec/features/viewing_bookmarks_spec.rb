feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://twitter.com"
    expect(page).to have_content "http://google.com"
  end
end