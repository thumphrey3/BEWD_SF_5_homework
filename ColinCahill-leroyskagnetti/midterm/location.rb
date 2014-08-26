require 'geocoder'

class Location

		attr_accessor :geocoder, :selection

	def initialize
		puts "Loading Location Finder".center(100,"~")
		self.location_enter
	end

	def location_enter
		puts "Please enter a location (cross-street, city, state, region, IP address):"
		@location = gets.chomp
		@geocoder = Geocoder.search(@location)
	end

	def location_results
		puts "The following matches have been found:\n\n"
		# binding.pry
		if @geocoder.size == 0
			puts "Sorry, but no results could be found for that search term.  Please try again."
			self.location_enter
		else
			@geocoder.each_with_index do |name, index|
				# [first , middle , last ].compact.join(',')
				puts "\(#{index + 1}\)  #{name.data["formatted_address"] || name.data["city"] + name.data["region_name"] + name.data["country_name"]}"

				""
			end
		end
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
			puts @coordinates
		# session.client.search(@search_query, :geocode =>@coordinates["lat"].float, @coordinates["lng"].float)
	end

end
