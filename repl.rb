# Inspired by Russ Olsen (http://eloquentruby.com)

require File.dirname(__FILE__) + '/tinybf'

bf = Bf.new lambda {|i| print i},  lambda { gets.chomp}

print "> "
until $stdin.eof?
  line = STDIN.readline.strip.gsub("\e[A\e[B[.", '')
  break if line == "exit"
  res = bf.eval(line.split(//))
  puts
  p res
  print "> "
end
