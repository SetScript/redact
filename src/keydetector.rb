require 'io/console'
require 'colorize'

file, text = ARGV[0], ''
head = "|=--=| REDACT |=--=from setscript=--=|-\n"
system('clear')
puts head + text

loop do
  case key = STDIN.getch
  when "\u0004"
    system('clear')
    print 'Сохранить файл? (y/n): '
    File.write(file, text) if STDIN.gets.chomp.downcase == 'y'
    puts 'Файл сохранен'.green
    break
  when "\r" then text += "\n"
  when "\u007f" then text.chop!
  else text += key
  end
  system('clear')
  puts head + text
end
