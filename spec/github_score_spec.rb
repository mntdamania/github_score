require "spec_helper"

describe GithubScore do

  context "#get" do
    let!(:body) {fixture("tenderlove.json").read}
    before {stub_request(:get, "https://github.com/tenderlove.json").to_return(:body => body, :headers => {:content_type => 'application/json; charset=utf-8'}) }


    it "should group by issue types" do
      stats = GithubScore::Score.group_issue_types("tenderlove")
      expect(stats[:IssueCommentEvent]).to eq(count_words(body, /IssueCommentEvent/)["IssueCommentEvent"])
      expect(stats[:PushEvent]).to eq(count_words(body, /PushEvent/)["PushEvent"])
      expect(stats[:PullRequestEvent]).to eq(count_words(body, /PullRequestEvent/)["PullRequestEvent"])
      expect(stats[:CreateEvent]).to eq(count_words(body, /CreateEvent/)["CreateEvent"])
      expect(stats[:CommitCommentEvent]).to eq(count_words(body, /CommitCommentEvent/)["CommitCommentEvent"])
    end
  end
end