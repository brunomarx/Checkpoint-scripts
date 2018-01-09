
#This script takes a filename as a parameter.
filename = ARGV.first

text = open(filename)
puts "Here is your filename #{filename}"

def CreateUser(user)
  target = open("output.txt", 'a')
  target.write("create user #{user}")
  target.write("\n")
  target.write("addelement users #{user} groups users:Group1")
  target.write("\n")
  target.close
end

def ProcessFile(txt)
  target = open("output.txt", 'w')
  target.close
  File.readlines(txt).each do |line|
    CreateUser(line.chomp)
  end
  target = open("output.txt", 'a')
  target.write("update_all")
  target.write("\n")
  target.close
end

ProcessFile(text)
