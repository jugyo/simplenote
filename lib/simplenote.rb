require 'httparty'
require 'base64'
require 'crack'

class SimpleNote
  include HTTParty
  attr_reader :token, :email
  format :json
  base_uri 'https://simple-note.appspot.com/api'

  def self.jsonize(method)
    class_eval do
      alias_method "_#{method}", method
      define_method(method) do |*args|
        Crack::JSON.parse self.send("_#{method}", *args).body
      end
    end
  end

  def self.textize(method)
    class_eval do
      alias_method "_#{method}", method
      define_method(method) do |*args|
        self.send("_#{method}", *args).body
      end
    end
  end

  def initialize(*args)
    self.login(*args)
  end

  def login(email, password)
    encoded_body = Base64.encode64({:email => email, :password => password}.to_params)
    @email = email
    @token = self.class.post "/login", :body => encoded_body
    raise "Login failed" unless @token.response.is_a?(Net::HTTPOK)
  end

  def get_index
    self.class.get "/index", :query => request_hash, :format => :json
  end
  jsonize :get_index

  def get_note(key)
    out = self.class.get "/note", :query => request_hash.merge(:key => key), :format => :plain
    out.response.is_a?(Net::HTTPNotFound) ? nil : out
  end
  textize :get_note

  def delete_note(key)
    out = self.class.get "/delete", :query => request_hash.merge(:key => key)
    raise "Couldn't delete note" unless out.response.is_a?(Net::HTTPOK)
    out
  end
  jsonize :delete_note

  def update_note(key, content)
    self.class.post "/note", :query => request_hash.merge(:key => key), :body => Base64.encode64(content)
  end
  jsonize :update_note

  def create_note(content)
    self.class.post "/note", :query => request_hash, :body => Base64.encode64(content)
  end
  jsonize :create_note

  def search(search_string, max_results=10)
    self.class.get "/search", :query => request_hash.merge(:query => search_string, :results => max_results)
  end
  jsonize :search

  def keys
    get_index.map do |i|
      i["key"]
    end
  end

  alias_method :[], :get_note
  alias_method :delete, :delete_note
  alias_method :[]=, :update_note
  alias_method :<<, :create_note

  private

  def request_hash
    { :auth => token, :email => email }
  end
end
