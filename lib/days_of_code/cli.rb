class DaysOfCode::CLI

  def call
    puts "Menu"
    puts "Welcome to 100 Days Of Code Stats"
    puts "Enter number for selection"
    puts "1. For the latest 15 tweets"
create_tweet
latest_15_tweets
  end

  def menu
    case input
    when 1
      latest_15_tweets
    when 2
      return
    end
  end


  def create_tweet
    tweet = DaysOfCode::Twitter.new.get_twitter["statuses"]
    DaysOfCode::Tweets.create_from_tweet(tweet)
  end


  def latest_15_tweets
    puts "                   The latest 15 tweets                  ".colorize(:color => :black, :background => :magenta, :mode => :bold)
    DaysOfCode::Tweets.all.each.with_index do |tweet, index|
       puts "#{index + 1}".colorize(:light_blue) + " #{tweet.text}"
     end
  end

  def recent_users
    abc_array = DaysOfCode::Tweets.all[0..9].collect do |tweet|
      tweet.screen_name
    end

    abc_array.each do |abc|
      puts abc
      end
  end






end
