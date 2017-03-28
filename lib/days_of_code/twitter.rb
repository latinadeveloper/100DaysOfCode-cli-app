# from twitter documentation
  class DaysOfCode::Twitter
    attr_reader :consumer

    #https://apps.twitter.com/
    def initialize(consumer_key = CONSUMER_KEY, consumer_secret = CONSUMER_SECRET)  #defaults from doNotCommit.rb
      @consumer = OAuth::Consumer.new(consumer_key, consumer_secret, { :site => "https://api.twitter.com", :scheme => :header })
      #consumer is to read only
    end

    def get_twitter
      # gets the request back from twitter
      response = consumer.request(:get, "https://api.twitter.com/1.1/search/tweets.json?q=%23100DaysOfCode")
      result = JSON.parse(response.body) # <-- response back from twitter
    end

    def get_more_tweets
      @additional_searches = []
      search_result = t.get_twitter

      3.times do
        @additional_searches += search_result["statuses"]   #== @additional_searches = ["statuses"]*** using += vs <<   << created array in away [[][]]

        next_search = search_result["search_metadata"]["next_results"]
        search_response = consumer.request(:get, "https://api.twitter.com/1.1/search/tweets.json" + next_search)
        search_result = JSON.parse(search_response.body)
      end
      @additional_searches
    end

  end



  def all_tweets
  ##get_twitter
  response = consumer.request(:get, "https://api.twitter.com/1.1/search/tweets.json?q=" + "next_results")
  result = JSON.parse(response.body)

  #tweet = DaysOfCode::Twitter.new.get_twitter["search_metadata"]["next_results"]


  end



#https://dev.twitter.com/oauth/overview/single-user   how to connect as a single user to twitter
#https://dev.twitter.com/rest/public/search   build a query
