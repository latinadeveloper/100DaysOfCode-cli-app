# from twitter documentation
class DaysOfCode::Twitter
  attr_reader :consumer

  ### https://apps.twitter.com/
  ### https://dev.twitter.com/oauth/overview/single-user   how to connect as a single user to twitter
  def initialize(consumer_key = CONSUMER_KEY, consumer_secret = CONSUMER_SECRET) ### defaults from doNotCommit.rb
    @consumer = OAuth::Consumer.new(consumer_key, consumer_secret, site: 'https://api.twitter.com', scheme: :header)
    # consumer is to read only
  end

  def get_twitter
    ### gets the request back from twitter https://dev.twitter.com/rest/public/search   build a query
    response = consumer.request(:get, 'https://api.twitter.com/1.1/search/tweets.json?count=100&result_type=recent&q=%23100DaysOfCode')
    result = JSON.parse(response.body) ### <-- response back from twitter
  end ### { "statuses": [ {tweet hash}, {}, ....], "search_metadata": {...} }

  def get_more_tweets
    @tweet_hash_search = []
    search_result = get_twitter
    ### { "statuses": [ {TH}, {TH}, ....], "search_metadata": {...} }
    ### https://dev.twitter.com/rest/public/timelines
    ### https://dev.twitter.com/rest/reference/get/search/tweets
    @tweet_hash_search += search_result['statuses']

    2.times do
      ###= @additional_searches = ["statuses"]*** using += vs <<   << created array in away [[][]]
      # ##^ [ {TH}, {TH}, ....]
      next_search = search_result['search_metadata']['next_results']
      search_response = consumer.request(:get, 'https://api.twitter.com/1.1/search/tweets.json' + next_search)
      search_result = JSON.parse(search_response.body)
      @tweet_hash_search += search_result['statuses']
    end
    @tweet_hash_search  ### returns every tweet tht
  end ### [ {TH}, {TH}, ....]

  def save
    File.open('tweets.json', 'w') do |file|
      file.write(@tweet_hash_search.to_json)
    end
  end

  def open
    file = File.read('tweets.json')
    @tweet_hash_search = JSON.parse(file)
  end


end ### end for class
