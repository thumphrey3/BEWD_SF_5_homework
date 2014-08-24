require 'lib/person'
require 'lib/secret_number'

class Game
# this class will be complex
	attr_accessor :player, :secret_number, :welcome_message, :guess, :guess_count

	def initialize
		@player = Player.new	
		@secret = SecretNumber.new
	end

	def welcome_message
		puts "Welcome to a new instance of your Game!\n  The rules are as follows:\n\n- You must guess a number between 1 and 10.\n- You have three chances to guess the number correctly.  The computer will give you hints on whether your guess is too high or too low.\n- If you are unable to guess the number within three chances, you will lose the game!"
	end

	def pick_number
		puts "#{@player.name}, Please pick a number."
	end

	def guess_loop

		@guess_count = 0

		while guess_count < 3 && guess != @secret.secret_number do
			@guess = gets.chomp
			if @guess == @secret.secret_number 
			puts "My stars!  You have guessed the secret number!"
			elsif @guess.to_i < @secret.secret_number
				puts "Hmm, I think that is a little low..."
				@guess_count = @guess_count + 1
				sleep 1
				puts "You have #{3 - guess_count} guesses remaining."
			elsif @guess.to_i > @secret.secret_number
				puts "Hmm, I think that is a little high..."
				@guess_count = @guess_count + 1
				sleep 1
				puts "You have #{3 - @guess_count} guesses remaining."			
			end
			
		end

		# sleep 2
		# 	puts "I'm sorry, #{@player.name}, you have failed to guess the secret number within 3 guesses.\n
		# 	The actual secret number was...."
		# 	sleep 2
		# 	puts "\t\t\t#{@secret.secret_number}!\n Would you like to play again? (y) or (n)"
		# 	response = gets.chomp.downcase
		# 	if response == "y" || response == "yes"
		# 		pick_number
		# 		guess_loop
		# 	else
		# 	end

	end
end
		
	

# we need to write logic to initialize a new game, and run the game loop
# we'll want to write a few separate methods for unique tasks so that our
# code is structured properly
