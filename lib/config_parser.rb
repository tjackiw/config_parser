class ConfigParser
  
  attr_accessor :config
  
  def initialize(data = "")
    @config = {}
    data.split(/\n/).each_with_index do |line,i|
      next if line.match('#')
      if line.match(/(.*)=(.*)/)
        @config[$1.strip] = case (value = $2.strip)
          when /on|yes|true/          then true
          when /off|no|false/         then false
          when /[-+]?[0-9]*\.?[0-9]+/ then Float.instance_eval(value)
          when /^\d+$/                then Fixnum.instance_eval(value)
          else value
        end
      else
        puts "WARNING: Line #{i+1} contains an invalid entry."
      end
    end
  end
  
  def method_missing(method)
    @config[method.to_s] || super
  end
  
  def to_s
    @config.inspect
  end
  
end
