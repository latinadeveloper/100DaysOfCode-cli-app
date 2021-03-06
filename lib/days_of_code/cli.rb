class DaysOfCode::CLI

  def call  ### loading the tweets
    if File.exist?('tweets.json')
      loads_saved_tweets
    else
      fetch_then_saves_tweets
    end
    menu
  end

  def menu
    loop do
      puts '  '
      puts '------- MENU ------'.colorize(:light_blue)
      puts "Welcome to \#100DaysOfCode Stats"
      puts "We have #{DaysOfCode::Tweet.all.count} tweets"
      puts 'Tweets range from ' + time_tweet_start + ' to ' + time_tweet_end
      puts 'Enter number for selection.'
      puts '   '
      puts '1. For the latest 15 tweets.' # get_twitter
      puts '2. To view a list of recent users in alphabetical order.'
      puts '3. To clear current list and refresh.'
      puts "4. Top 20 users with the most tweets using \#100DaysOfCode hashtag from our current data."
      puts '5. View details on a user name.'
      puts '   Type exit to end program.'.colorize(:red)
      print ':'.colorize(color: :black, background: :yellow, mode: :blink)
      input = gets.strip

      case input

      when '1'
        latest_15_tweets

      when '2'
        puts "How many users do you want to see from 1 to #{DaysOfCode::Tweet.all.count}?"
        request = gets.to_i
        recent_users(request)

      when '3'
        DaysOfCode::Tweet.clear_tweets
        fetch_then_saves_tweets
        puts "Downloaded #{DaysOfCode::Tweet.all.count} recent tweets."

      when '4'
        stats_user_tweets_count

      when '5'
        puts 'Type the user name you would like more detail on.'
        request_detail = gets.strip
        search_user_detail(request_detail)
      when 'exit'
        return
      else
        puts 'Invalid choice'
      end

      if  !yes_or_no
        return ### ends
      end

    end ### end of loop
  end ### end menu

  def stats_user_tweets_count # ##count for each identical element
    counts = Hash.new(0)   #0 default in case it doesnt have a value

    DaysOfCode::Tweet.all.each do |tweet|
      counts[tweet.screen_name] += 1
    end
    counts.sort_by { |key, val| val }.reverse[0...20].each do |screen_name, total_tweets|  ###reverse due to high to low
      puts screen_name.to_s + " #{total_tweets}"
    end
  end

  def recent_users(request)
    puts '--- Recent users ---'.colorize(color: :black, background: :magenta, mode: :bold)
    abc_array = DaysOfCode::Tweet.all[0...request].collect do |tweet|
      tweet.screen_name.downcase
    end

    abc_array.uniq.sort.each do |abc|
      puts abc
    end
  end

  # puts request_detail.inspect
  def search_user_detail(request_detail)
    detail_user_tweet = DaysOfCode::Tweet.all.find_all do |tweet|
      tweet.screen_name.downcase == request_detail.downcase
    end
    if detail_user_tweet == []
      puts 'username not in our file'.colorize(:red)
      return
    end

    puts "The username #{request_detail}\'s first tweet in our file is "
    puts detail_user_tweet[-1].text.colorize(:light_blue)
    puts "This tweet was created on #{detail_user_tweet[-1].time_string}"
  end

  def fetch_then_saves_tweets
    twitter = DaysOfCode::Twitter.new
    tweet_hash_search = twitter.get_more_tweets
    twitter.save

    DaysOfCode::Tweet.create_from_tweet(tweet_hash_search )
  end

  def loads_saved_tweets
    twitter = DaysOfCode::Twitter.new
    tweet_hash_search = twitter.open

    DaysOfCode::Tweet.create_from_tweet(tweet_hash_search )
  end

  def latest_15_tweets
    puts '- - - - - - - The latest 15 tweets - - - - - - -'.colorize(color: :black, background: :magenta, mode: :bold)
    DaysOfCode::Tweet.all[0...15].each.with_index do |tweet, index|
      puts (index + 1).to_s.colorize(:light_blue) + " #{tweet.text}"
    end
  end

  def time_tweet_end
    DaysOfCode::Tweet.all[0].time_string
    ### http://www.foragoodstrftime.com/
  end

  def time_tweet_start
    DaysOfCode::Tweet.all[-1].time_string
  end

  def yes_or_no
    puts '   '
    puts ' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.colorize(:blue)
    loop do
      puts ' Do you want another option?'
      input = gets.downcase.strip
      if input == 'no' || input == 'n'
        return false

      elsif input == 'yes' || input == 'y'
        return true

      else
        puts 'Choose yes or no'
      end
    end
  end

end ### end of class
