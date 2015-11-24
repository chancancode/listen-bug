require 'fileutils'

FileUtils.mkdir_p('tmp')

('a'..'z').each { |i| FileUtils.mkdir_p("tmp/#{i}") }

100_000.times { |i| File.open("tmp/#{i}.txt", "w") { |f| f.write(i) } }