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
      @citation::to(Formats::valueOf(format.upcase))
    end
    private :to
    
    def method_missing(method, *args, &block)
      if(formats.include? formatize( method ))
        self.class.send(:define_method, method) do
          send directionize(method).to_sym, formatize(method)
        end
        send method, *args, &block
      else
        super
      end
    end
    
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
  end
end