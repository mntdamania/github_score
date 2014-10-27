require "spec_helper"

describe GithubScore do

  context "#get" do

    before {stub_request(:get, "https://github.com/tenderlove.json").to_return(:body => fixture("tenderlove.json"), :headers => {:content_type => 'application/json; charset=utf-8'}) }

    it "should be an array" do
      expect(GithubScore.get_user_stats("tenderlove")).to be_a(Array)
    end
  end
end