require 'tmpdir'
require 'listen'
require 'fileutils'

if ENV['USE_LISTEN'] == '1'
  ('a'..'z').each do |i|
    begin
      puts "Watching tmp/#{i}... "
      Listen.to("tmp/#{i}", &proc{}).start
      sleep 1
    ensure
      Listen.stop
      puts "Stopped watching tmp/#{i}"
    end
  end
end

100_000.times do |i|
  File.open("tmp/#{i}.txt") { |f| puts "Opened tmp/#{i}.txt: #{f.read}" }
end