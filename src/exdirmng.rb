require_relative '../src/CommandParser'
require_relative '../src/DirRepository'

class Main
  def initialize()
    if ARGV.count==0 then
      helpmsg
      exit
    else
      cp = CommandParser.new(ARGV)
      cmd = cp.parse
      case cmd.type
      when "generate"
        dr = DirRepository.new(cmd.dir_name,cmd.header,cmd.format,cmd.max)
        dr.make
      when "submit"
        exit if !File.exist?(cmd.dir_name + "/.exdirmng.conf")
        conf = open(cmd.dir_name + "/.exdirmng.conf",'r')
        max = conf.read.split("\n")[2]
        scount = 0
        count = 0
        for d in Dir.entries(cmd.dir_name)
          next if (d == ".") || (d == "..")
          if Dir.exists?(cmd.dir_name + "/" + d) then
            if Dir.entries(cmd.dir_name + "/" + d).count > 2 then 
              print "[o]"
              scount += 1
            else
              print "[x]"
            end
            print d + " "
            count += 1
            if count ==10 then
              puts ""
              count == 0
            end
          end
        end
        puts ""
        puts "Submission status (" + scount.to_s + "/" + max.to_s + ")"
      when "list"
        sdir(Dir.home,1,cmd.verbose)
        sdir(Dir.pwd,1,cmd.verbose) if Dir.home.split('/').count + 2< Dir.pwd.split('/').count
        puts "" if cmd.verbose == 0
      end
    end
  end

  def sdir(path,n,isv)
    return if (n > 3)
    for d in Dir.entries(path)
      next if (d == ".") || (d == "..")
      if Dir.exists?(path + "/" + d) then
        if File.exist?(path + "/" + d + "/.exdirmng.conf") then
          if isv == 1 then
            puts path + "/" + d + " "
          else
            print d + " "
          end
        else
          sdir(path + "/" + d,n+1,isv)
        end
      end
    end
  end

  def helpmsg()
    puts "Usage: exdirmng [COMMAND] [DIRECTORY] [OPTION]"
    puts "Create and manage assignment directories."
    puts ""
    puts "You can use following commands:"
    puts "generate      Create assignment directory."
    puts "submit        Check submission status."
    puts "list          List made directories."
    puts ""
    puts "You can use following options:"
    puts "-h, -header   Directory name starts with specification header."
    puts "              Default is Ex."
    puts "-f, -format   Set directory number format. Default is 1."
    puts "              If format is 1, numbers don't contain 0."
    puts "              If format is 2, numbers contain 0 like 01,02..."
    puts "-m, -max      Set how many directories make. Default is 13."
    puts ""
    puts ""
  end
end

Main.new
