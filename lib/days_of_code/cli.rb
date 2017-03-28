class DaysOfCode::CLI


  def call
    create_tweet
    menu
  end

  def menu

    loop do
      puts "----- Menu-----"
      puts "Welcome to 100 Days Of Code Stats"
      puts "Enter number for selection"
      puts "   "
      puts "1. For the latest 15 tweets"
      puts "2. Request a number of recent users"
      print ":".colorize(:color => :black, :background => :yellow, :mode => :blink)
        input = gets.to_i


      case input
      when 1
        latest_15_tweets
      when 2
        puts "How many recent users do you want to see from 1 to 15"
        request = gets.to_i
        recent_users(request)
      end


      if !yes_or_no
        return # ends
      end


    end # end of loop
  end # end menu






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
