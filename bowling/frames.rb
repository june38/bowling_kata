# frames.rb
# define class Pins
class Frame
	@@MAX_PIN = 10

	def initialize()
	# Instance variables
		@stand_pin = @@MAX_PIN
		@falling_pin = 0
		@current_score = 0
		@hit_counter = 0
		@bonus = 0
		@state = "NORMAL"
		@MAX_HIT = 2
		@strike_hitcounter = 2
		@isTenthFrame = false
	end

	def hit(number)
		- puts "Hit Number #{@hit_counter} Max: #{@MAX_HIT}"
		+ # puts "Hit Number #{@hit_counter} Max: #{@MAX_HIT}"
			if @hit_counter < @MAX_HIT
				if(number <= @stand_pin)
					total_fall = setfalling_pin(number)
					if(number == @@MAX_PIN)
						@hit_counter += @strike_hitcounter
						setBonus(2)
						@state = "STRIKE"
						if(@isTenthFrame)
							@MAX_HIT = 3
						end
					else
						@hit_counter += 1
						if(total_fall == @@MAX_PIN)
							setBonus(1)
							@state = "SPARE"
							- puts "Check isTenthFrame: #{@isTenthFrame}"
							+ # puts "Check isTenthFrame: #{@isTenthFrame}"
							if(@isTenthFrame)
								@MAX_HIT = 3
								- puts "Set MAX_HIT: #{@MAX_HIT}"
								+ # puts "Set MAX_HIT: #{@MAX_HIT}"
							end
						elsif(@hit_counter == @MAX_HIT)
							@state = "END"
						else
							@state = "NORMAL"
						end
					end
				else
					puts "Number(#{number}) more than pins(#{@stand_pin})! Try Again!"
				end
			else
				puts "Exceed Hit Number #{@hit_counter}"
				@state = "END"
			end
		- display()
		+ # display()
		return @state
	end

	def setfalling_pin(number)
		@falling_pin += number
		@stand_pin -= number
		puts "You hit #{number} pins. Total fallen pin = #{@falling_pin}"
		addScore(number)
		return @falling_pin
	end

	def addBonusScore(number)
	# puts "Bonus(#{@bonus})"
		if(@bonus > 0)
			@bonus -= 1;
			addScore(number)
		else
		end
		return getScore()
	end

	def tenthFrameActivate()
		@isTenthFrame = true
		@strike_hitcounter = 1
	end

	def resetPin()
		@stand_pin = @@MAX_PIN
		@falling_pin = 0
	end

	def setBonus(number)
		if @isTenthFrame
			@bonus = 0
		else
			@bonus = number
		end
	end

	def addScore(number)
		@current_score += number
	end

	def getScore
		return @current_score
	end

	def display
		puts "You have #{@stand_pin} Pins left State: #{@state}"
		puts "Current Score: #{@current_score}"
	end
	# def display
	# puts "I am of #{@breed} breed and my name is #{@name}"
	# end
end 