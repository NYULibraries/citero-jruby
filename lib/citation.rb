#Citation class, used in builder form as Citation.map("some data").from_format.to_format
module Citation
  require 'java'
  require 'citation.jar'

  def self.map *args
    Base.new *args
  end
  
  class Base
    
    java_import Java::EduNyuLibraryCitation::Citation
    java_import Java::EduNyuLibraryCitation::Formats
    
    def initialize data
      @citation = Citation::map(data)
      self
    end
    
    def from format
      begin
        @citation = @citation::from(Formats::valueOf(format.upcase))
      rescue Exception => e
        raise TypeError, "Mismatched data for #{format}"
      end
      self
    end
    private :from
    
    def to format
      begin
        @citation::to(Formats::valueOf(format.upcase))
      rescue Exception => e
        raise ArgumentError, "Missing a source format. Use from_[format] first."
      end
    end
    private :to
    
    def method_missing(method, *args, &block)
      if(matches? method)
        self.class.send(:define_method, method) do
          send directionize(method).to_sym, formatize(method)
        end
        send method, *args, &block
      else
        super
      end
    end
    
    def respond_to? method, include_private=false
      if(matches? method)
        return true
      else
        super
      end
    end
    
    def matches? method
      formats.include? formatize(method) and directions.include? directionize(method)
    end
    private :matches?
    
    def directionize method
      method.to_s.split( "_", 2).first
    end
    private :directionize
    
    def formatize method
      method.to_s.split( "_", 2).last
    end
    private :formatize
    
    def formats
      @formats ||= Formats::values.collect {|format| format.name.downcase}
    end
    
    def directions
      @directions ||= ["to", "from"]
    end
  end
end