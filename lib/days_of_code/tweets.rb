#tweet class where the tweets are called
class DaysOfCode::Tweets
attr_accessor :username, :location #datauserid???

  @@all_tweets = []

  def initialize(tweet)
    @@all_tweets << self
  end

  def self.create_from_tweet(tweet)
    tweet_array.each do |tweet_received|
      Tweets.new(tweet_array)
    end
  end


end


#DaysOfCode::Twitter.new.get_twitter["statuses"][0]["id"]   unique user id
