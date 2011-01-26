module SinatraAwsS3
  
  def self.config(&block)
    if block_given?
      yield Config.instance
    else
      Config.instance
    end
  end
  
  class Config
    def self.instance
      @@instance ||= Config.new
      return @@instance
    end
    
    def initialize(data={})
      @data = {}
      update!(data)
    end

    def update!(data)
      data.each do |key, value|
        self[key] = value
      end
    end

    def [](key)
      @data[key.to_sym]
    end

    def []=(key, value)
      if value.class == Hash
        @data[key.to_sym] = Config.new(value)
      else
        @data[key.to_sym] = value
      end
    end

    def method_missing(sym, *args)
      if sym.to_s =~ /(.+)=$/
        self[$1] = args.first
      else
        self[sym]
      end
    end
  end
end
