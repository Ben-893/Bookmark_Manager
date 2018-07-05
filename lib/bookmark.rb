require 'pg'

class Bookmark

attr_reader :id, :url

def initialize(id, url)
@id = id
@url = url
end


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test') 
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT id, url FROM bookmarks;")
    result.map { |result| Bookmark.new(result["id"], result["url"]) }
  end

  def self.create(options)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
  end
    return nil unless is_url?(options[:url])
    anything = connection.exec("INSERT INTO bookmarks (url) VALUES('#{options[:url]}') RETURNING id, url;")
    Bookmark.new(anything.first["id"], anything.first["url"])
    end

def ==(other)
@id == other.id
  end


def self.is_url?(url)
  url =~ /\A#{URI::regexp(['http', 'https'])}\z/
end
end
