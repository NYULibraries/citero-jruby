require 'citero/CSF'
# Citero class, used in builder form as Citero.map("some data").from_format.to_format
module Citero
  # Java is required in this module.
  require 'java'
  require 'citero/citero.jar'

  java_import Java::EduNyuLibraryCitero::Formats

  # Calling the map method creates a new instance of the Base class, with splatter operator passed in
  def self.map *args
    Base.new *args
  end

  # List of available formats Citero exports to as a module class method for quick checks.
  def self.to_formats
    @to_formats ||= Formats::values.select {|format| format.isDestinationFormat }.collect {|format| format.name.downcase}
  end
  
  # List of available formats Citero exports from as a module class method for quick checks.
  def self.from_formats
    @from_formats ||= Formats::values.select {|format| format.isSourceFormat }.collect {|format| format.name.downcase}
  end
  
  # The Base class is the true wrapper for citation
  class Base
    
    # Import of important java files.
    JavaCitero = Java::EduNyuLibraryCitero::Citero
    
    
    # The constructor, takes input data taken from the parent module
    # and creates an instance of the Citero java object. 
    # Returns itself for builder patttern.
    def initialize data
      @citero = JavaCitero::map(data)
      self
    end
    
    # The from method is private, it takes in a format and gets
    # the appropriate Format java class and then calls
    # the from method in the Citero java object and stores its
    # return value in an instance variable.
    # Returns itself.
    def from format
      begin
        #Formats are enums in java, so they are all uppercase
        @citero = @citero::from(Formats::valueOf(format.upcase))
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
    # the to method in the Citero java object and returns the
    # return value as a string.
    def to format
      begin
        #Formats are enums in java, so they are all uppercase
        @citero::to(Formats::valueOf(format.upcase))
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
    def method_missing(meth, *args, &block)
      # Check to see if it can be evaluated
      if(matches? meth)
        #Defines the method and caches it to the class
        self.class.send(:define_method, meth) do
          # Splits the method and parameter. See formatize and directionize
          send directionize(meth).to_sym, formatize(meth)
        end
        # calls the method
        send meth, *args, &block
      else
        super
      end
    end
    
    # Returns true if the method can be evaluated to a method name
    # and parameter.
    def respond_to? meth, include_private=false
      if(matches? meth)
        return true
      else
        super
      end
    end
    
    # Private method. Checks to see if the method name is in the list of methods
    # that can accept the formats, and checks to see if the formats are in a list
    # of formats as defined by the Java enum Format.
    def matches? meth
      directions.include? directionize(meth) and method("#{directionize(meth)}_formats").call.include? formatize(meth)
    end
    private :matches?
    
    # Splits the method to get its direction, or method ie to and from.
    def directionize meth, delimiter="_"
      meth.to_s.split(delimiter, 2).first
    end
    private :directionize
    
    # Splits the method to get its format, or parameter ie csf or ris.
    def formatize meth, delimiter="_"
      meth.to_s.split(delimiter, 2).last
    end
    private :formatize
    
    # List of available directions or methods.
    def directions
      @directions ||= ["to", "from"]
    end
    private :directions
    
    # List of available formats Citero exports to.
    def to_formats
      @to_formats ||= Citero.to_formats
    end
    
    # List of available formats Citero exports from.
    def from_formats
      @from_formats ||= Citero.from_formats
    end
  end
end