# from twitter documentation
#https://dev.twitter.com/oauth/overview/single-user   how to connect as a single user to twitter

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
end




  #https://dev.twitter.com/rest/public/search   build a query
