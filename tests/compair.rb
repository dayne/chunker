#!/usr/bin/env ruby

def boom(); puts "arrgh"; exit; end

one = ARGV.shift || boom
two = ARGV.shift || boom

one_md5 = []
two_md5 = []
File.open(one) { |f| f.each_line { |l| one_md5.push l } }
File.open(two) { |f| f.each_line { |l| two_md5.push l } }

count = 0
two_md5.each do |m2|
  count += 1 if one_md5.include?(m2)
end

puts count
