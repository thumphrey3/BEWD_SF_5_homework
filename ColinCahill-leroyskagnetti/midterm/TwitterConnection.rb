require 'twitter'
require 'rest-client'

#Including OpenSSL disabler to avoid conflicts on outdated OpenSSL terminals.

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class TwitterConnection

 attr_accessor :client, :query

  def initialize
  # Initializes new connection to Twitter API.
  # connection info found here:  http://rdoc.info/gems/twitter
  
  
     puts "Loading New Twitter Session".center(100,"~")
     @client = Twitter::REST::Client.new do |config|
       config.consumer_key        = "1OjqzZ6XVPN6hbyWWVhR5hrNw"
       config.consumer_secret     = "UvZSkz63JEJoPJ9tuTDEdTvbGAQlj46iMtDFjy33m3OGzmpZ4O"
       config.access_token        = "149583545-UFOXnvuFn2Ug0Ujeyz6O9hCFuWZCJx0jTCfvJGcR"
       config.access_token_secret = "yJmaXu5OrwvaJp6XE0Ie4EdNZORLOxxQK9RlUmCIdnQZ3" 
      end
  end

 
  def search_input
    puts "Please enter a search term on Twitter:"
    @query = gets.chomp
  end

  def search
    puts "Let me check on that..."
         @results = client.search(@query, :result_type => "recent", :count => 10).take(10)
  end


  def search_result
    @results.each do |tweet|
    puts "\nUser #{tweet.user.screen_name}\nTweet Text: \"#{tweet.text}\"\nTweet time: #{tweet.created_at}\n"
    sleep 1
    end
  end

  def location_search_filter
      puts "Now, please enter a search term to filter results, or press enter to display all results near your location."
      @query = gets.chomp
      @search_radius="5mi"
  end

  def search_location_results
    @results = client.search(@query, :geocode =>"#{@geo_search.coordinates},@search_radius")
  end

end