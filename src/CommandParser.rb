require_relative '../src/Command'
class CommandParser
attr_reader :argv
  def initialize(argv)
    @argv = argv
  end

  def parse
    if @argv[0] == "generate" then

    end
  end
end
