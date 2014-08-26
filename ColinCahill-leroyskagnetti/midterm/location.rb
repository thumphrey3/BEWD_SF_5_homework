require 'geocoder'

class Location

		attr_accessor :geocoder, :selection

	def initialize
		puts "Please enter a location:"
		@location = gets.chomp
		@geocoder = Geocoder.search(@location)
		self.search_results
	end

	def search_results
		puts "The following matches have been found:\n\n"
		@geocoder.each_with_index do |name, index|
			puts "\(#{index + 1}\)  #{name.data["formatted_address"]}"
		end
		self.select_result
	end

	def select_result
		puts "Please enter the number of the closest geographical match to your search query:"
		@selection = gets.chomp.to_i
			if @selection < 1
				puts "You must enter a valid number to proceed."
				self.select_result
			else
				self.geo_tweets
			end
	end

	def geo_tweets
		@search_radius="5mi"
		@coordinates = @geocoder[@selection-1].data["geometry"]["location"]
		puts "Great.  Now enter a search term to filter tweets in the location you've selected.  Or, press enter to display all tweets from your location."
			@search_query = gets.chomp
			binding.pry
		# session.client.search(@search_query, :geocode =>@coordinates["lat"].float, @coordinates["lng"].float)
	end

end
