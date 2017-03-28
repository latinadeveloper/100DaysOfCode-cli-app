class DaysOfCode::CLI

  def call
    create_tweet
    menu

  end

  def menu

    loop do
      puts "----- Menu-----"
      puts "Welcome to 100 Days Of Code Stats"
      puts "we have #{DaysOfCode::Tweets.all.count} tweets"
      puts "Enter number for selection."
      puts "   "
      puts "1. For the latest 15 tweets."   #get_twitter
      puts "2. To view a list of recent users in alphabetical order."
      puts "3. To clear current list and refresh to latest 15 tweets."
      puts "Type exit to end program."
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
        create_tweet
        latest_15_tweets
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


  def create_tweet
    twitter = DaysOfCode::Twitter.new
    tweet = twitter.get_more_tweets
    DaysOfCode::Tweets.create_from_tweet(tweet)
    # twitter.save  ###calls method to save
  end



  # def create_tweet
  #   tweet = DaysOfCode::Twitter.new.get_twitter["statuses"]
  #   DaysOfCode::Tweets.create_from_tweet(tweet)
  # end


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

  def stats_user_tweets_count   ###count for each identical element
    DaysOfCode::Tweets.all
    counts = Hash.new(0)

    DaysOfCode::Tweets.all.each do |tweet|
      counts[tweet.screen_name] += 1
    end

  end


  def yes_or_no
    puts " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    loop do
      puts " Do you want another option?"
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




end
