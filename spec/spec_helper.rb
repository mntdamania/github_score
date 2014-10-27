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