require_relative '../src/Command'
class CommandParser
attr_reader :argv
  def initialize(argv)
    @argv = argv
  end

  def parse
    if (@argv[0] == "g")||(@argv[0] == "generate") then

    elsif (@argv[0] == "s")||(@argv[0] == "submit") then

    elsif (@argv[0] == "l")||(@argv[0] == "list") then

    else

    end
  end
end
