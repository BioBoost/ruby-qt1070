require "i2c"

module Qt1070
class Qt1070

	I2C_ADDRESS = 0x1B

	def initialize port
		@i2c = I2C.create port
 	end

  def chip_id
    id = read 0x00
    minor = id & 0x0F
    major = (id >> 4) & 0x0F
    {major: major, minor: minor}
  end

  def firmware_version
    version = read 0x01
    minor = id & 0x0F
    major = (id >> 4) & 0x0F
    "#{major}.#{minor}"
  end

  def detection_status
    status = read 0x02
    return "Calibrate" if status & (1 << 7) != 0
    return "Touch" if status & (1 << 0) != 0
    return "Overflow" if status & (1 << 6) != 0
    "Undefined"
  end

  def key_status
    status_value = read 0x03
    status = {}
    8.times do |i|
      status["key#{i}".to_sym] = status_value & (1 << i) != 0 ? "pressed" : "released"
    end
    status
  end

  def key_status key
    raise "Key index must be between 0 and 6" unless key.between? 0, 6
    status_value = read 0x03
    status_value & (1 << key) != 0 ? "pressed" : "released"
  end

  def key_signal key
    raise "Key index must be between 0 and 6" unless key.between? 0, 6
    register = 0x04 + (key * 2)
    signal = read register, 2
    ((signal[1] * 256) + signal[0])
  end

  def reference_data key
    raise "Key index must be between 0 and 6" unless key.between? 0, 6
    register = 18 + (key * 2)
    data = read register, 2
    ((data[1] * 256) + data[0])
  end

  #TODO write to this register
  def negative_threshold_level key
    raise "Key index must be between 0 and 6" unless key.between? 0, 6
    read 32 + key
  end

  #TODO write to this register
  def adjacent_key_suppression_level key
    #TODO parse/check result
    raise "Key index must be between 0 and 6" unless key.between? 0, 6
    read 39 + key
  end

  #TODO write to this register
  def detection_integrator_counter key
    #TODO parse/check result
    raise "Key index must be between 0 and 6" unless key.between? 0, 6
    read 46 + key
  end

  #TODO write to this register
  def fo_mo_guard_no
    #TODO parse/check result
    read 53
  end

  #TODO write to this register
  def low_power_mode
    #TODO parse/check result
    read 54
  end

  #TODO write to this register
  def maximum_on_duration
    #TODO parse/check result
    read 55
  end

  #TODO write to this register
  def calibrate
    #TODO parse/check result
    read 56
  end

  #TODO write to this register
  def reset
    #TODO parse/check result
    read 57
  end

  private
  def read register, read_bytes = 1
    @i2c.read I2C_ADDRESS, read_bytes , register
  end
end

end
