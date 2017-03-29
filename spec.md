# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
- [x ] Pull data from an external source
      This project uses the Twitter Search REST API to retrieve tweets with a
      hashtag #100daysofcode https://dev.twitter.com/rest/public/search

      The data that I was interested in getting required a modification to the search parameters in the url. The parameters that were used were:
        q - this is required
        result_type - to ask the type of results I want to receive
        count - changed the default to retrieve more than 15 tweets


- [X ] Implement both list and detail views
      List views were used in:
      Menu option 1 shows a list of the most recent 15 tweets.

      Menu option 2 shows a list of the user's screen name in alphabetical order. The user is asked how many users they want to see.

      Detail views are seen in:
      Menu option 4. The 20 users with the most tweets using the hashtag are seen here. Multiple requests to twitter were made here to gather a larger sample of data.

      Menu option 5 allows the user to enter a twitter username to view their first tweet in the data retrieved from Twitter, as well as the time it was created.
