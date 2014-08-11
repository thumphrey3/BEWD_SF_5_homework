# Teddit Contionals - Starter Code.

# Let's add a new Teddit feature. Upvotes!
# Complete the application below. 
# Where you see comments (lines that begin with #) replace it with code so that the program works.

def get_input
	gets.chomp.downcase
end

def story_stats(story, upvotes)
	# Write code so that:
		# If the Story is about cats multiply the upvotes by 5
		# If the Story is about bacon multiply the upvotes by 8
		# If the Story is about Food it gets 3 times the upvotes.

	#For example:
	# "Cats frolic despite tuna shortage" should give you 5 times the upvotes!
	"Story: \t\t\t\t#{story.capitalize} \nPost-Multiplier Upvotes: \t#{upvotes}"
end

puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"
puts "Please enter a News story:"
story = get_input

puts "How many upvotes before topic multiplier?"
upvotes = get_input
if story.include? 'cats'
	upvotes = upvotes.to_i * 5
elsif story.include? 'bacon'
	upvotes = upvotes.to_i * 8
elsif story.include? 'food'
	upvotes = upvotes.to_i * 3
end

puts story_stats(story, upvotes)