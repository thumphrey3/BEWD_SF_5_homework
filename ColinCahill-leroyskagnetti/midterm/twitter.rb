require 'twitter'
require 'rest-client'
require_relative 'user'
require_relative 'location'

class Session
	
	attr_accessor :client, :search_queries, :user, :geo_search

	def initialize
		#connection info found here:  http://rdoc.info/gems/twitter
		puts "Loading New Twitter Session".center(100,"~")
		@client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "1OjqzZ6XVPN6hbyWWVhR5hrNw"
		  config.consumer_secret     = "UvZSkz63JEJoPJ9tuTDEdTvbGAQlj46iMtDFjy33m3OGzmpZ4O"
		  config.access_token        = "149583545-UFOXnvuFn2Ug0Ujeyz6O9hCFuWZCJx0jTCfvJGcR"
		  config.access_token_secret = "yJmaXu5OrwvaJp6XE0Ie4EdNZORLOxxQK9RlUmCIdnQZ3"  
		end

		@user = User.new
		@search_queries = []
		self.options_present
		self.game_chooser
	end


	def options_present
		puts "\n#{self.user.name}, please make a selection.  Would you like to:\n"
		puts "(S)earch for tweets?\n(V)iew trending tweets from your location."
	end

	def game_chooser
		user_choice = gets.chomp.downcase
		if user_choice == 's'
			self.search_input
		elsif user_choice == 'v'
			@geo_search = Location.new
		else 
			puts "Please enter \"S\" or \"V\" to select from the above options."
			self.game_chooser
		end
	end

	def search_input
		puts "Please enter a search term on Twitter:"
		@search_query = gets.chomp
		@search_queries << @search_query
		puts "Let me check on that..."
		self.return_result
	end

	def return_result
		client.search(@search_query, :result_type => "recent", :count => 10).take(10).each do |tweet|
  		puts "\nUser #{tweet.user.screen_name}\nTweet Text: \"#{tweet.text}\"\nTweet time: #{tweet.created_at}\n"
  		sleep 1
  		end
  		self.options_present
  		self.game_chooser
	end

	
end


