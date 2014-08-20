#Apartment class.
class Apartment

	attr_accessor :name, :apt_sqft, :apt_bedrooms, :apt_bathrooms, :renter, :rent

	def initialize(name, apt_sqft, apt_bedrooms, apt_bathrooms)
	    @name = name
	    @apt_sqft = apt_sqft
	    @apt_bedrooms = apt_bedrooms
	    @apt_bathrooms = apt_bathrooms
  	end 

	def to_s 
		"#{@name} #{@apt_sqft} square feet #{@apt_bedrooms} bedrooms #{@apt_bathrooms} bathrooms."
	end
end
