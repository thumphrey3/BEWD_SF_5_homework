require 'lib/person'
require 'lib/secret_number'

class Game
# this class will be complex
	attr_accessor :player, :secret_number, :welcome_message, :guess

	def initialize
		@player = Player.new	
		@secret_number = SecretNumber.new
	end

	def welcome_message
		puts "Welcome to a new instance of your Game!\n  The rules are as follows:\n\n- You must guess a number between 1 and 10.\n- You have three chances to guess the number correctly.  The computer will give you hints on whether your guess is too high or too low.\n- If you are unable to guess the number within three chances, you will lose the game!"
	end

	def pick_number
		puts "#{@player.name}, Please pick a number."
	end

	def guess_loop
		@guess_count = 0
		@guess = gets.chomp.to_i
		if @guess == @secret_number
		puts "My stars!  You have guessed the secret number!"

		elsif @guess < @secret_number
			puts "Hmm, I think that is a little low..."
			@guess_count = @guess_count + 1
			sleep 1
			puts "You have #{3 - guess_count} guesses remaining."
		elsif @guess > @secret_number
			puts "Hmm, I think that is a little high..."
			@guess_count = @guess_count + 1
			sleep 1
			puts "You have #{3 - @guess_count} guesses remaining."
	end
	end
end

# we need to write logic to initialize a new game, and run the game loop
# we'll want to write a few separate methods for unique tasks so that our
# code is structured properly

