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
        raise "CommandPerse:Failed to perse"
      end
      exdir = @argv[1]
      i=2
      dir_h = "Ex"
      fmt = 1
      max = 13
      while i < @argv.count do
        if @argv[i][0] == "-" then
          if (@argv.count > i) && (@argv[i+1] != "-") then
            case @argv[i][1]
            when "h" then
              dir_h = @argv[i+1]
            when "f" then
              fmt = @argv[i+1].to_i
            when "m" then
              max = @argv[i+1].to_i
            end
            i +=2
          else
            raise "CommandPerse:Failed to perse"
          end
        else
          raise "CommandPerse:Failed to perse"
        end
      end
      Command.new(@argv[0],exdir,dir_h,fmt,max)
    elsif (@argv[0] == "s")||(@argv[0] == "submit") then
      if @argv.count < 2 then
          raise "CommandParse:Failed to perse"
      end
      exdir = @argv[1]
      Command.new(@argv[0],exdir,"",0,0)
    elsif (@argv[0] == "l")||(@argv[0] == "list") then
      Command.new(@argv[0],"","",0,0)
    elsif (@argv[0] == "moo") then
      puts "Hello, moo!"
      puts "And I am tired... (__))..zzzZZZ"
      exit
    else
      Command.new("directory","","",0,0)
    end
  end
end
