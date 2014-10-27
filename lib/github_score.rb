require "github_score/version"
require "github_score/cli"
require "net/http"
require "json"

module GithubScore

  class Score


    def self.group_issue_types(username)
      json_data = get_user_stats(username)
      grouped_counts = json_data.group_by { |w| w["type"] }.inject({}) do |tmphash, (k,v)|
        tmphash[k.to_sym] = v.size
        tmphash
      end
    end

    private

    def self.get_user_stats(username)
      req = Net::HTTP.get(URI.parse("https://github.com/#{username}.json"))
      JSON.parse(req)
    end

  end

end
