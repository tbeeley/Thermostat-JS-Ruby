class Thermostat

	def initialize
		@temperature = 20
		@psm_mode = true
	end

	attr_accessor :temperature, :psm_mode

	def turn_psm_off
		@psm_mode = false
	end

	def maximum_temperature
		psm_mode == true ? 25 : 32
	end

	def increase_temperature
		unless temperature >= maximum_temperature
			@temperature += 1
		end
	end

end
