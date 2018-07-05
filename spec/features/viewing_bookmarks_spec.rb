require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do

    Bookmark.create(url: "http://makersacademy.com")
    Bookmark.create(url: "http://twitter.com")
    Bookmark.create(url: "http://google.com")

    visit('/bookmarks')

    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://twitter.com"
    expect(page).to have_content "http://google.com"
  end
end