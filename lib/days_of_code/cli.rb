class DaysOfCode::CLI

  def call
    puts "Menu"
    puts "Welcome to 100 Days Of Code Stats"
    puts "Enter number for selection"
    puts "1. For the latest 15 tweets"
    # input = get.strip
  end

  def menu
    case input
    when 1
      latest_15_tweets
    when 2
      #exit
    end
  end


  def create_tweet
    tweet = DaysOfCode::Twitter.new.get_twitter["statuses"]
    DaysOfCode::Tweets.create_from_tweet(tweet)
  end


  def latest_15_tweets
    DaysOfCode::Tweets.all.each do |tweet|
       puts "#{tweet.text}  "
     end

  end
end
