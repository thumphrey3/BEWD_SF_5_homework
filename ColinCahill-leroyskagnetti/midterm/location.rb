require 'geocoder'

class Location

		attr_accessor :geocoder, :selection, :coordinates

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

	def coordinates
		@coordinates = nil
	end

	def select_result
		puts "Please enter the number of the closest geographical match to your search query:"
		@selection = gets.chomp.to_i
			if @selection < 1
				puts "You must enter a valid number to proceed."
				self.select_result
			else
				puts "Great.  Your selection has been recorded."
				geo_result = @geocoder[@selection-1].data
				@coordinates = "#{geo_result["geometry"]["location"]["lat"]},#{geo_result["geometry"]["location"]["lng"]}" || "#{geo_result["latitude"]},#{geo_result["latitude"]}" 
			end
	end
end
