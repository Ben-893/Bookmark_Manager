require_relative '../models/bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do


    bookmark_1 = Bookmark.create(url: "http://makersacademy.com")
    bookmark_2 = Bookmark.create(url: "http://twitter.com")
    bookmark_3 = Bookmark.create(url: "http://google.com")

  expected_bookmarks = [
      bookmark_1,
      bookmark_2,
      bookmark_3
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

describe '.create' do
  it 'creates a new bookmark' do
  anything_that_you_want = Bookmark.create(url: 'http://www.testbookmark.com')

    expect(Bookmark.all).to include anything_that_you_want
    end
  end

describe '.create' do
  it 'does not create a new bookmark if the URL is not valid' do
    Bookmark.create(url: 'not a real bookmark')

    expect(Bookmark.all).not_to include 'not a real bookmark'
  end
 end
end

