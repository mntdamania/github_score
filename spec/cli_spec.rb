require "spec_helper"

describe GithubScore::CLI do

  let!(:body) {fixture("tenderlove.json").read}
  before {stub_request(:get, "https://github.com/tenderlove.json").to_return(:body => body, :headers => {:content_type => 'application/json; charset=utf-8'}) }

  it "should parse the short cli options" do
    cli = GithubScore::CLI.new(%w(--u dhh -c 10 -P 10 -p 10 -w 10 -o 10))
    expect(cli.options[:user]).to eq("dhh")
    expect(cli.options[:CreateEvent]).to eq("10")
    expect(cli.options[:PushEvent]).to eq("10")
    expect(cli.options[:PullRequestReviewCommentEvent]).to eq("10")
    expect(cli.options[:WatchEvent]).to eq("10")
    expect(cli.options[:Other]).to eq("10")
  end

  it "should parse the long cli options" do
    cli = GithubScore::CLI.new(%w(--user dhh --CreateEvent 10 --PushEvent 10 --PullRequestReviewCommentEvent 10 --WatchEvent 10 --Other 10))
    expect(cli.options[:user]).to eq("dhh")
    expect(cli.options[:CreateEvent]).to eq("10")
    expect(cli.options[:PushEvent]).to eq("10")
    expect(cli.options[:PullRequestReviewCommentEvent]).to eq("10")
    expect(cli.options[:WatchEvent]).to eq("10")
    expect(cli.options[:Other]).to eq("10")
  end
  
end