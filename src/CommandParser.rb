# -*- coding: utf-8 -*-
require_relative '../src/Command'
class CommandParser
attr_reader :argv
  def initialize(argv)
    @argv = argv
  end

  def parse
    if (@argv[0] == "g")||(@argv[0] == "generate") then
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
              fmt = @argv[i+1]
            when "m" then
              max = @argv[i+1]
            end
            i += 2
          end
        else
          raise "CommandPerseエラー"
        end
      end
      Command.new(@argv[0],exdir,dir_h,fmt,max)
    elsif (@argv[0] == "s")||(@argv[0] == "submit") then

    elsif (@argv[0] == "l")||(@argv[0] == "list") then

    else

    end
  end
end
