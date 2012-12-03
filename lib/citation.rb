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
        raise TypeError, "Mismatched data/format.#{format}"
      end
      self
    end
    
    def to format
      @citation::to(Formats::valueOf(format.upcase))
    end
    
    def method_missing(method, *args, &block)
      if(formats.include? method.to_s)
        self.class.send(:define_method, method) do
          eval(find_method (method.to_s.include?("from_") ? "from" : "to"), method.to_s)
        end
        send method, *args, &block
      else
        super
      end
    end
    
    def find_method direction, name
      "#{direction} \"#{name.sub("#{direction}_",'')}\""
    end
    
    def formats
      @formats ||= Formats::values.collect do |format|
          "from_#{format.name.downcase}"
      end +
      Formats::values.collect do |format|
          "to_#{format.name.downcase}"
      end
    end
  end
end