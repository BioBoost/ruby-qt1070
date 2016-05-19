require "i2c"

module Qt1070
class Qt1070
  	
	I2C_ADDRESS = 0x1B
	
	def initialize port
		@i2c = I2C.create port	
 	end

	def state
		@i2c.read I2C_ADDRESS, 1 , 0x03
	end
end

end
