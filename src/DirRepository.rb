class DirRepository
  attr_reader :name

  def initialize(dir_name,header,format,max)
    @name = dir_name
    @header = header
    @format = format
    @max = max
  end

  def make
    Dir.mkdir(@name,0705)
    (1..max).to_a.each{|item| Dir.mkdir("%s/%s%2d"%[@name,@header,item])}
  end

end
