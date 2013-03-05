module Citero
  
  # Java is required in this module.
  require 'java'
  require 'citero/citero.jar'
  
  #CSF class, used to interact directly with available metadata.
  class CSF
    # CSF object from Citero that is to be used
    CSF = Java::EduNyuLibraryCitero::CSF
    
    # Initialize the CSF object with data
    def initialize data
      @csf = CSF::new(data)
    end
    
    # The method_missing override checks to see if the called method
    # can be evaluated to a key, then stores it and calls it if it can.
    # For example, .itemType or .authors.
    def method_missing(meth, *args, &block)
      # Check to see if it can be evaluated
      if(matches? meth)
        #Defines the method and caches it to the class
        self.class.send(:define_method, meth) do
          # Splits the method and parameter. See formatize and directionize
          @csf::config()::getStringArray(meth.to_s).to_a
        end
        # calls the method
        send meth, *args, &block
      else
        super
      end
    end
    
    # Returns true if the method can be evaluated to a key
    def respond_to? meth, include_private=false
      if(matches? meth)
        return true
      else
        super
      end
    end
    
    # Private method. Checks to see if the method name is a valid key
    # for the configuration file.
    def matches? meth
      @csf::config()::containsKey(meth.to_s)
    end
    private :matches?
    
    # A list of keys that is available in this properties configuration
    def keys
      @keys ||= Array.new(@csf::config()::getKeys.collect {|key| key})
    end
  end
end