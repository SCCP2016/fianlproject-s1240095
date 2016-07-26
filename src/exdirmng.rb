require_relative '../src/CommandParser'
require_relative '../src/DirRepository'

class Main
  def initialize()
    if ARGV.count==0 then
      puts "Usage: exdirmng [COMMAND] [DIRECTORY] [OPTION]"
      puts "Create and manage assignment directories."
      puts ""
      puts "You can use following commands:"
      puts "generate      Create assignment directory."
      puts "submit        Check submission status."
      puts "list          List made directories."
      puts ""
      puts "You can also use following options:"
      puts "-h, -header   Directory name starts with specification header."
      puts "              Default is Ex."
      puts "-f, -format   Set directory number format. Default is 1."
      puts "              If format is 1, numbers don't contain 0."
      puts "              If format is 2, numbers contain 0 like 01,02..."
      puts "-m, -max      Set how many directories make. Default is 13."
      puts ""
      puts ""
      exit
    else
      cp = CommandParser.new(ARGV)
      cmd = cp.parse
      case cmd.type
      when "generate"
        dr = DirRepository.new(cmd.dir_name,cmd.header,cmd.format,cmd.max)
        dr.make
      when "submit"
        if !File.exist?(cmd.dir_name + "/.exdirmng.conf") then exit end
        conf = open(cmd.dir_name + "/.exdirmng.conf",'r')
        max = conf.read.split("\n")[2]
        count = 0
        for d in Dir.entries(cmd.dir_name)
          if (d == ".") || (d == "..") then next end
          if Dir.exists?(cmd.dir_name + "/" + d) then
            if Dir.entries(cmd.dir_name + "/" + d).count > 2 then 
              print "[o]"
              count += 1
            else
              print "[x]"
            end
            print d + " "
          end
        end
        puts ""
        puts "Submission status (" + count.to_s + "/" + max.to_s + ")"
      when "list"
        dlist = ""
        for d in Dir.entries(Dir.pwd)
          if (d == ".") || (d == "..") then next end
          if Dir.exists?(d) then
            if File.exist?(d + "/.exdirmng.conf") then print d + " " end
          end
        end
      end
    end
  end
end

Main.new
