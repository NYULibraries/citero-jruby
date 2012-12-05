# Citation class, used in builder form as Citation.map("some data").from_format.to_format
module Citation
  # Java is required in this module.
  require 'java'
  require 'bin/citation.jar'

  # Calling the map method creates a new instance of the Base class, with splatter operator passed in
  def self.map *args
    Base.new *args
  end
  
  # The Base class is the true wrapper for citation
  class Base
    
    # Import of important java files.
    java_import Java::EduNyuLibraryCitation::Citation
    java_import Java::EduNyuLibraryCitation::Formats
    
    # The constructor, takes input data taken from the parent module
    # and creates an instance of the Citation java object. 
    # Returns itself for builder patttern.
    def initialize data
      @citation = Citation::map(data)
      self
    end
    
    # The from method is private, it takes in a format and gets
    # the appropriate Format java class and then calls
    # the from method in the Citation java object and stores its
    # return value in an instance variable.
    # Returns itself.
    def from format
      begin
        #Formats are enums in java, so they are all uppercase
        @citation = @citation::from(Formats::valueOf(format.upcase))
      #rescue any exceptions, if the error is not caught in JAR, most likely a 
      #problem with the data
      rescue Exception => e
        raise TypeError, "Mismatched data for #{format}"
      end
      self
    end
    private :from
    
    # The to method is private, it takes in a format and gets
    # the appropriate Format java class and then calls
    # the to method in the Citation java object and returns the
    # return value as a string.
    def to format
      begin
        #Formats are enums in java, so they are all uppercase
        @citation::to(Formats::valueOf(format.upcase))
      #rescue any exceptions, if the error is not caught in JAR, most likely a 
      #problem with the source format
      rescue Exception => e
        raise ArgumentError, "Missing a source format. Use from_[format] first."
      end
    end
    private :to
    
    # The method_missing override checks to see if the called method
    # can be evaluated to a method name and parameter, then stores it
    # and calls it if it can.
    # For example, to_csf or from_pnx. pnx_to will not work.
    def method_missing(method, *args, &block)
      # Check to see if it can be evaluated
      if(matches? method)
        #D efines the method and caches it to the class
        self.class.send(:define_method, method) do
          # Splits the method and parameter. See formatize and directionize
          send directionize(method).to_sym, formatize(method)
        end
        # calls the method
        send method, *args, &block
      else
        super
      end
    end
    
    # Returns true if the method can be evaluated to a method name
    # and parameter.
    def respond_to? method, include_private=false
      if(matches? method)
        return true
      else
        super
      end
    end
    
    # Private method. Checks to see if the method name is in the list of methods
    # that can accept the formats, and checks to see if the formats are in a list
    # of formats as defined by the Java enum Format.
    def matches? method
      formats.include? formatize(method) and directions.include? directionize(method)
    end
    private :matches?
    
    # Splits the method to get its direction, or method ie to and from.
    def directionize method, delimiter="_"
      method.to_s.split(delimiter, 2).first
    end
    private :directionize
    
    # Splits the method to get its format, or parameter ie csf or ris.
    def formatize method, delimiter="_"
      method.to_s.split(delimiter, 2).last
    end
    private :formatize
    
    # Extracts list of formats from the java enum Format.
    def formats
      # Downcase the formats for ruby
      @formats ||= Formats::values.collect {|format| format.name.downcase}
    end
    
    # List of available directions or methods.
    def directions
      @directions ||= ["to", "from"]
    end
  end
end