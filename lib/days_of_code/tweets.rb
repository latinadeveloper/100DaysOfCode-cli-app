#tweet class where the tweets are called
class DaysOfCode::Tweets
attr_accessor :screen_name, :location, :created_at, :text  #datauserid???


  @@all_tweets = [ ]

  def initialize(tweet_hash)
    @@all_tweets << self


  end

  def self.create_from_tweet(tweet_array)
    tweet_array.each do |tweet_hash|
      self.new(tweet_hash)
    end
  end

  def self.all
    @@all_tweets
  end



end


#DaysOfCode::Twitter.new.get_twitter["statuses"][0]["id"]   unique user id
