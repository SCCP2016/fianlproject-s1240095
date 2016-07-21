class Command
attr_accessor :type, :dir_name, :header, :format, :max

  def initialize(type,dir_name,header,format,max)
    @type = type
    @dir_name = dir_name
    @header = header
    @format = format
    @max = max
  end
end
