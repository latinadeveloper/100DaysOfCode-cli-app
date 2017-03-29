class DaysOfCode::CLI

  def call
    if File.exist?("tweets.json")
      loads_saved_tweets
    else
      fetch_then_saves_tweets
    end
    menu

  end

  def menu

    loop do
      puts "  "
      puts "------- MENU ------".colorize(:blue)
      puts "Welcome to 100 Days Of Code Stats"
      puts "We have #{DaysOfCode::Tweets.all.count} tweets"
      puts "Enter number for selection."
      puts "   "
      puts "1. For the latest 15 tweets."   #get_twitter
      puts "2. To view a list of recent users in alphabetical order."
      puts "3. To clear current list and refresh."
      puts "4. Top 20 users with the most tweets using \#100DaysOfCode hashtag."
      puts "   Type exit to end program.".colorize(:red)
      print ":".colorize(:color => :black, :background => :yellow, :mode => :blink)
        input = gets.strip

      optional_choice = true

      case input

      when "1"
        latest_15_tweets
      when "2"
        puts "How many users do you want to see from 1 to #{DaysOfCode::Tweets.all.count}?"
        request = gets.to_i
        recent_users(request)
      when "3"
        DaysOfCode::Tweets.clear_tweets
        fetch_then_saves_tweets
        puts "Downloaded #{DaysOfCode::Tweets.all.count} recent tweets."

      when "4"
        stats_user_tweets_count


      when "exit"
        return
      else
        puts "Invalid choice"
        optional_choice = false

      end


      if optional_choice && !yes_or_no
        return ### ends
      end


    end ### end of loop
  end ### end menu


  def stats_user_tweets_count   ###count for each identical element
    DaysOfCode::Tweets.all
    counts = Hash.new(0)

    DaysOfCode::Tweets.all.each do |tweet|
      counts[tweet.screen_name] += 1
    end
     counts.sort_by{|key, val| val}.reverse[0...20].each do |screen_name, total_tweets|
        puts "#{screen_name}" +  " #{total_tweets}"
      end


  end


  def fetch_then_saves_tweets
    twitter = DaysOfCode::Twitter.new
    tweet = twitter.get_more_tweets

    DaysOfCode::Tweets.create_from_tweet(tweet)
    twitter.save  ###calls method to save to tweets.json

  end

  def loads_saved_tweets
    twitter = DaysOfCode::Twitter.new
    tweet = twitter.open

    DaysOfCode::Tweets.create_from_tweet(tweet)
  end



  def latest_15_tweets
    puts "- - - - - - - The latest 15 tweets - - - - - - -".colorize(:color => :black, :background => :magenta, :mode => :bold)
    DaysOfCode::Tweets.all[0...15].each.with_index do |tweet, index|
       puts "#{index + 1}".colorize(:light_blue) + " #{tweet.text}"
     end
  end

  def recent_users(request)
      puts "                   Recent users                 ".colorize(:color => :black, :background => :magenta, :mode => :bold)
    abc_array = DaysOfCode::Tweets.all[0...request].collect do |tweet|
      tweet.screen_name.downcase
    end

    abc_array.sort.each do |abc|
      puts abc
      end
  end




  def yes_or_no
    puts "   "
    puts " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:magenta)
    loop do
      puts " Do you want another option?".colorize(:blue)
      input = gets.downcase.strip
      if input == "no" || input == "n"
        return false

      elsif  input == "yes" || input == "y"
        return true

      else
        puts "Choose yes or no"
      end
    end
  end



    ###used before iteriating tweets method created
    # def create_tweet
    #   tweet = DaysOfCode::Twitter.new.get_twitter["statuses"]
    #   DaysOfCode::Tweets.create_from_tweet(tweet)
    # end


end
