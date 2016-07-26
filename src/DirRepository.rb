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
    conf = open(@name + "/.exdirmng.conf", 'w')
    conf.write(@header + "\n" + @format.to_s + "\n" + @max.to_s)
    conf.close
    if @format==1 then 
      (1..@max).to_a.each{|item| Dir.mkdir("%s/%s%d"%[@name,@header,item])}
    elsif @format==2 then
      (1..@max).to_a.each{|item| Dir.mkdir("%s/%s%02d"%[@name,@header,item])}
    else
      raise "DirRepository:Format error"
    end
  end

end
