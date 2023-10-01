# keydetector file

file = ARGV[0]

begin
    text = File.read(file)
    head = "~ REDACT\n      -by setscript\n--------------------\n\n".green
    system('clear')
    puts head + text
rescue TypeError
    puts "Redact: file not found\n      - press enter for exit".red
end

begin
loop do
  case key = STDIN.getch
  when "\u0004"
    system('clear')
    print 'Save file? (Y/n): '.yellow
    File.write(file, text) if STDIN.gets.chomp.downcase == 'y'
    puts 'OK.'.green
    break
  when "\r" then text += "\n"
  when "\u007f" then text.chop!
  else text += key
  end
  system('clear')
  puts head + text
end
rescue
    print "Redact: exit with error".yellow
end
