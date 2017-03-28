### tweet class where the tweets are called
class DaysOfCode::Tweets
attr_accessor :screen_name, :location, :created_at, :text  ### atauserid???

  @@all_tweets = [ ]

  def initialize(tweet_hash)
    @@all_tweets << self

    @screen_name = tweet_hash["user"]["screen_name"]
    @location = tweet_hash["user"]["location"]
    @text = tweet_hash["text"]
    @created_at = tweet_hash["created_at"]
  end

  def self.create_from_tweet(tweet_array) ### [ {TH}, {TH}, ....]
    tweet_array.each do |tweet_hash|
      self.new(tweet_hash)
    end ### []
  end



  def self.all
    @@all_tweets
  end

  def self.clear_tweets
    @@all_tweets.clear

  end



end


###DaysOfCode::Twitter.new.get_twitter["statuses"][0]["id"]   unique user id
