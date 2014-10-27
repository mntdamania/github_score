require "github_score/version"
require "json"

module GithubScore
  def self.get_user_stats(username='dhh')
    req = Net::HTTP.get(URI.parse("https://github.com/#{username}.json"))
    JSON.parse(req)
  end
end
