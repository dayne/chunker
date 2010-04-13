#!/usr/bin/env ruby

require 'digest/md5'
require 'optparse'

def boom(msg='')
  puts msg
  exit
end

target = ARGV.shift || boom

KILO=1024
MEGA=1024*KILO

options = {
  :chunk => 1*MEGA
}

file_end = File.size(target)
count = 0

File.open(target) do |file|
  while(r = file.read( options[:chunk] ) )
    runmd5 = Digest::MD5.new
    runmd5 << r
    puts runmd5.hexdigest
  end
end
