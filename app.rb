require 'bundler'
require 'pry'
require_relative 'lib/atbash.rb'

atbash = Atbash.new

puts atbash.decrypt(text: 'knlfgnb, sj koqj o yvnewju')
puts atbash.encrypt(text: 'houston, we have a problem')

