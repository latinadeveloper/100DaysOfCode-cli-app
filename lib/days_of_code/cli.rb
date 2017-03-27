class DaysOfCode::CLI

  def call
    puts "Menu"
    puts "Welcome to 100 Days Of Code Stats"
    puts "Enter number for selection"
    puts "1. For the latest 15 tweets"

    input = get.strip
  end

  def menu
    case input
    when 1
      #last 15 tweets
    when 2
      #exit

  end



end
