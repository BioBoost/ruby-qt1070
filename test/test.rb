$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'qt1070'

include Qt1070


touch = Qt1070::Qt1070.new "/dev/i2c-1"

puts "QT1070 state: #{touch.state.chr}"
