class Thermostat

	def initialize
		@temperature = 20
		@psm_mode = false
	end

	attr_accessor :temperature, :psm_mode

	def turn_psm_on
		@psm_mode = true
	end

	def maximum_temperature
		psm_mode == true ? 25 : 32
	end

	def increase_temperature
		unless temperature >= maximum_temperature
			@temperature += 1
		end
	end

	def decrease_temperature
		unless temperature <= 10
			@temperature -= 1
		end
	end

	def reset_temperature
		@temperature = 20
	end

	def energy_score
		if temperature < 18
			return 'efficient'
		elsif temperature < 25
			return 'average'
		else
			return 'inefficient'
		end
	end

end
