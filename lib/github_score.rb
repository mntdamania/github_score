require "github_score/version"
require "github_score/cli"
require "json"

module GithubScore


  

  def self.get_user_stats(username='dhh')
    req = Net::HTTP.get(URI.parse("https://github.com/#{username}.json"))
    JSON.parse(req)
  end

  # def self.


end
