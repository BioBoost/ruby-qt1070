$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'qt1070'

include Qt1070


touch = Qt1070::Qt1070.new "/dev/i2c-1"



puts "Chip id: #{touch.chip_id.inspect}"
puts "Firmware version: #{touch.firmware_version}"
puts "Detection status: #{touch.detection_status}"
puts "QT1070 state: #{touch.key_status}"
puts "Key 1 signal: #{touch.key_signal 1}"
