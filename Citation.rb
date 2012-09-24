class Citation
  require 'java'

  Dir[ENV['CITATION'] + '/*.jar'].each {|f| require f}
  Dir[ENV['M2_HOME'] + '/repository/**/*.jar'].each { |f| require f }

  java_import Java::EduNyuLibraryCitation::Citation
  java_import Java::edu.nyu.library.citation.Formats

  @item
  @data
  
  def map(payload)
    @data = payload
    return self
  end

  def from(format)
    case format.downcase
    when "csf"
      @item = Citation.new(@data, Formats::CSF)
      return self
    when "pnx"
      @item = Citation.new(@data, Formats::PNX)
      return self
    when "bibtex"
      @item = Citation.new(@data, Formats::BIBTEX)
      return self
    when "ris"
      @item = Citation.new(@data, Formats::RIS)
      return self
    when "openurl"
      @item = Citation.new(@data, Formats::OPENURL)
      return self
    else
      raise TypeError, 'Invalid format'
    end
  end
  

  def to(format)
    case format.downcase
    when "csf"
      return @item::output(Formats::CSF)
    when "pnx"
      return @item::output(Formats::PNX)
    when "bibtex"
      return @item::output(Formats::BIBTEX)
    when "ris"
      return @item::output(Formats::RIS)
    when "openurl"
      return @item::output(Formats::OPENURL)
    else
      raise TypeError, 'Invalid format'
    end
  end
end