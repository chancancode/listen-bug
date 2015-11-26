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

str = []

1000.times do
  str << Array.new(10_000, "a").map { |i| "b" }.join * 10
  str.pop
end

5000.times do |i|
  str << Array.new(10_000, "a").map { |i| "b" }.join * 10
  str.pop
  File.open("tmp/#{i}.txt") { |f| puts "Opened tmp/#{i}.txt: #{f.read}" }
end