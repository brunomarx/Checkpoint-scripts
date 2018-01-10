#Version 0.1
#This script takes a filename as a parameter.
#Usage: #ruby BulkUserAdd.rb input.txt
#The output file contains a series of DBEDIT commands that should
# be first converted from DOS to unix if necessary.

filename = ARGV.first
text = open(filename)

#Function creates the commands for adding users in DBEDIT language and write them to the output file.
def CreateUser(user)
  target = open("output.txt", 'a')
  target.write("create user #{user}")
  target.write("\n")
  target.write("addelement users #{user} groups users:Group1")
  target.write("\n")
  target.close
end

#Function opens the input file and generates commands for every line containing a user name.
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
