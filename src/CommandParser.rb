# -*- coding: utf-8 -*-
require_relative '../src/Command'
class CommandParser
attr_reader :argv
  def initialize(argv)
    @argv = argv
  end

  def parse
    if (@argv[0] == "g")||(@argv[0] == "generate") then
      if @argv.count < 2 then
        puts "Insufficient arguments"
        exit
      end
      exdir = @argv[1]
      i=2
      dir_h = "Ex"
      fmt = 1
      max = 13
      while i < @argv.count do
        if @argv[i][0] == "-" then
          if (@argv.count > i + 1) && (@argv[i+1] != "-") then
            case @argv[i][1]
            when "h" then
              dir_h = @argv[i+1]
              i +=1
            when "f" then
              fmt = @argv[i+1].to_i
              i +=1
            when "m" then
              max = @argv[i+1].to_i
              i +=1
            when "v" then

            else
              puts "Invalid arguments"
              exit
            end
            i +=1
          else
            puts "Invalid arguments"
            exit
          end
        else
          puts "Invalid arguments"
          exit
        end
      end
      Command.new("generate",exdir,dir_h,fmt,max,0)
    elsif (@argv[0] == "s")||(@argv[0] == "submit") then
      if @argv.count < 2 then
        puts "Insufficient arguments"
        exit
      end
      exdir = @argv[1]
      Command.new("submit",exdir,"",0,0,0)
    elsif (@argv[0] == "l")||(@argv[0] == "list") then
      i = 1;
      isv = 0;
      while i < @argv.count do
        if @argv[i][0] == "-" then
          if (@argv.count > i) && (@argv[i+1] != "-") then
            case @argv[i][1]
            when "v" then
              isv = 1
            else
              puts "Invalid arguments"
              exit
            end
            i += 1
          else
            puts "Invalid arguments"
            exit
          end
        else
          puts "Invalid arguments"
          exit
        end
      end
      Command.new("list","","",0,0,isv)
    elsif (@argv[0] == "moo") then
      puts "Hello, moo!"
      puts "And I am tired... (__))..zzzZZZ"
      exit
    else
      if Dir.exist?(@argv[0]) then
        Command.new("submit",@argv[0],"",0,0,0)
      else
        puts "Unknown command."
        exit
      end
    end
  end
end
