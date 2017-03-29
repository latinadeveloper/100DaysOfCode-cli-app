# 100DaysOfCode
100 Days of Code Stats and Data


## This project was inspired out of curiosity of the hashtag #100DaysOfCode.
This hashtag was created by [@ka11away](https://twitter.com/ka11away) as a way to challenge others
to expand their knowledge in the world of code. For more information on this challenge you can
find that information [here](https://medium.freecodecamp.com/join-the-100daysofcode-556ddb4579e4).

One of the rules of this challenge is to tweet about your progress everyday using the corresponding
hashtag. As I started to participate in this challenge I began to be curious on how many people
has started the challenge this year 2017, how many people were actually tweeting daily,
after how many days are the people starting no longer tweet about their progress, etc.

I created this cli to explore those questions as well as part of the Flatiron School Learn online [curriculum]
(https://flatironschool.com/campuses/online/).

## Installation
Go to the directory and click clone or download.

## Twitter Account
You must create a twitter account at [Twitter Apps] (https://apps.twitter.com/) for this to work.
Create a file named doNotCommit.rb under the config file directory.
This file will be used to save the consumer key which you will want to keep to yourself.
*do not commit this file so you can keep your keys secure*

CONSUMER_KEY = *your consumer key here as a string*
CONSUMER_SECRET = *your consumer secret here as a string*

## Usage
Run: 100Days from your terminal  `bin/100days`
A tweets.json file will appear on your root once the code is run for the first time.
This file stores the tweets fetched from twitter. If it is deleted the program will re-fetch the tweets.

## Development
You can also run `bin/console` for an interactive prompt.

This is currently not available in a gem for the time being. Document will be updated when it is.

## Contributing
Bug reports and pull requests are welcome on GitHub at  https://github.com/latinadeveloper/100DaysOfCode-cli-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
