class Citation
  require 'java'

  Dir[ENV['CITATION'] + '/*.jar'].each {|f| require f}
  Dir[ENV['M2_HOME'] + '/repository/**/*.jar'].each { |f| require f }

  java_import Java::EduNyuLibraryCitation::Citation
  java_import Java::edu.nyu.library.citation.Formats

  @item
  
  def map(payload)
    @item = Citation.map(payload)
    return self
  end

  def from(format)
    case format.downcase
    when "csf"
      @item = @item::from(Formats::CSF)
      return self
    when "pnx"
      @item = @item::from(Formats::PNX)
      return self
    when "bibtex"
      @item = @item::from(Formats::BIBTEX)
      return self
    when "ris"
      @item = @item::from(Formats::RIS)
      return self
    when "openurl"
      @item = @item::from(Formats::OPENURL)
      return self
    else
      raise TypeError, 'Invalid format'
    end
  end
  

  def to(format)
    case format.downcase
    when "csf"
      return @item::to(Formats::CSF)
    when "pnx"
      return @item::to(Formats::PNX)
    when "bibtex"
      return @item::to(Formats::BIBTEX)
    when "ris"
      return @item::to(Formats::RIS)
    when "openurl"
      return @item::to(Formats::OPENURL)
    else
      raise TypeError, 'Invalid format'
    end
  end
end