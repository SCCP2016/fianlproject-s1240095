class Command
attr_accessor :type, :dir_name, :header, :format, :max, :verbose

  def initialize(type,dir_name,header,format,max,verbose)
    @type = type
    @dir_name = dir_name
    @header = header
    @format = format
    @max = max
    @verbose = verbose
  end
end
