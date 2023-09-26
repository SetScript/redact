require "colorize"
allgood = true

begin 
	require_relative "deps.rb"
	allgood == true
rescue
	allgood == false
ensure
	if allgood == true
		puts "all good".green
	elsif allgood == false
		puts "deps is not install".red
	end
end
