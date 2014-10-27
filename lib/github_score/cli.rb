require 'optparse'

module GithubScore

  class CLI
    attr_accessor :options, :arguments

    def initialize(argv)
      @argv = argv
      @options = {
        :user => "dhh",
        :PushEvent => "5",
        :PullRequestReviewCommentEvent => "4",
        :WatchEvent => "3",
        :CreateEvent => "2",
        :Other => "1"
      }
      calcuate
      # parse!
    end

    def parser
      @parser = OptionParser.new do |opts|
        opts.banner = "Usage"

        opts.on("-u", "--user USER", "Github username, default #{@options[:user]}") {|user| @options[:user] = user}

        opts.on("-p", "--PushEvent PushEvent", "Github PushEvent, default #{@options[:PushEvent]}") {|push| @options[:PushEvent] = push}

        opts.on("-P", "--PullRequestReviewCommentEvent PullRequestReviewCommentEvent", 
                "Github PullRequestReviewCommentEvent, default #{@options[:PullRequestReviewCommentEvent]}") {|pull| @options[:PullRequestReviewCommentEvent] = pull}

        opts.on("-w", "--WatchEvent WatchEvent", "Github WatchEvent,  default #{@options[:WatchEvent]}") {|watch| @options[:WatchEvent] = watch}

        opts.on("-c", "--CreateEvent CreateEvent", "Github CreateEvent,  default #{@options[:CreateEvent]}") {|create| @options[:CreateEvent] = create}

        opts.on("-o", "--Other Other Events", "Github Other Events,  default #{@options[:Other]}") {|other| @options[:Other] = other}
      end
    end

    def parse!
      parser.parse! @argv
    end

    def calcuate
      parse!
      stats = GithubScore::Score.group_issue_types(@options[:user])
      ary = []
      stats.each {|k, v| ary << (v.to_i * multiplier(k).to_i)}
      total = ary.inject(0, :+)
      puts "#{@options[:user]} has the score of #{total}"
    end

    private

    def multiplier(key)
      @options.fetch(key) {@options[:Other].to_i}
    end

  end
end