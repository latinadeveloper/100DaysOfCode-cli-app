# from twitter documentation
#https://dev.twitter.com/oauth/overview/single-user   how to connect as a single user to twitter

class DaysOfCode::Twitter
attr_reader :consumer

#https://apps.twitter.com/
  def initialize(consumer_key, consumer_secret)
    @consumer = OAuth::Consumer.new(consumer_key, consumer_secret, { :site => "https://api.twitter.com", :scheme => :header })
    #consumer is to read only
  end

  def get_twitter
    # gets the request back from twitter
    response = consumer.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
  end
end
