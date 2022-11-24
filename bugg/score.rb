#!/usr/bin/ruby
require 'ruby2d'

set width: 900, height: 500
if ARGV.length < 3
  Text.new("Score: " + ARGV[0])
else
  Text.new("Player 1: " + ARGV[0])
  Text.new("Player 2: " + ARGV[2], y: 25)
end
if ARGV[1] == "C"
  Text.new("You hit a green block!", y: 60)
elsif ARGV[1] == "O"
  Text.new("Out of bounds!", y: 60)
elsif ARGV[1] == "G"
  Text.new("Goodbye!", y: 60)
elsif ARGV[1] == "W"
  Text.new("Wrong Settings", y: 60)
end
highscore = File.read("./highscore.txt").chomp
if ARGV[0].to_i > highscore.to_i
  File.write("./highscore.txt", ARGV[0])
end
if ARGV[3].to_i > File.read("./highscore.txt").chomp.to_i
  File.write("./highscore.txt").chomp
end
highscore = File.read("./highscore.txt").chomp
Text.new("High Score: #{highscore}", y: 120)
show
