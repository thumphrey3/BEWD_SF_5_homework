require_relative 'user'
require_relative 'location'
require_relative 'TwitterConnection'

class Session
	
	attr_accessor :client, :user, :geo_search, :twitter

	def initialize
		@twitter = TwitterConnection.new
		@user = User.new
	end

	def start
		self.options_present
		self.game_chooser
	end

	def options_present
		puts "\n#{@user.name}, please make a selection.  Would you like to:\n\n"
		puts "(S)earch for tweets?\n(V)iew trending tweets from your location.\n(Q)uit"
	end

	def game_chooser
		user_choice = gets.chomp.downcase
		if user_choice == 's'
			@twitter.search_input
			@twitter.search
			@twitter.search_result
			self.start
		elsif user_choice == 'v'
			@geo_search = Location.new
			@geo_search.location_results
			@geo_search.select_result
			@twitter.location_search_filter
			@twitter.search_location_results
		elsif user_choice == 'q'
			puts "Thanks for playing!"
			exit
		else 
			puts "Please enter \"S\", \"V\", or \"Q\" to select from the above options."
			self.game_chooser
		end
	end

	
end


