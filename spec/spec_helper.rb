$:.unshift(File.expand_path("../../lib", __FILE__))
require "rspec"
require "github_score"
require "pry"
require "webmock/rspec"


def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end


def count_words(string, regex)
  string.scan(regex).reduce(Hash.new{|i|0}){|res,w| res[w]+=1;res}
end

RSpec.configure do |config|

  config.before(:each) do
    WebMock.stub_request(:any, /.*github.*/)
    WebMock.stub_request(:get, "https://github.com/dhh.json").to_return(:body => fixture("dhh.json").read, :headers => {:content_type => 'application/json; charset=utf-8'})
    WebMock.stub_request(:get, "https://github.com/ryanb.json").to_return(:body => fixture("ryanb.json").read, :headers => {:content_type => 'application/json; charset=utf-8'})
  end

end