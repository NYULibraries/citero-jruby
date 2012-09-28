#Citation class, used in builder form as Citation.new.map("some data").from("some format").to("some format")
class Citation
  require 'java'

  Dir[ENV['CITATION'] + '/**/*.jar'].each {|f| require f}
  Dir[ENV['MAVEN'] + '/repository/**/*.jar'].each { |f| require f }

  java_import Java::EduNyuLibraryCitation::Citation
  java_import Java::edu.nyu.library.citation.Formats

  @item

  def map(payload)
    @item = Citation.map(payload)
    return self
  end

  def from(format)
    begin
      @item = @item::from(Formats::valueOf(format.upcase))
      return self
    rescue Exception => e
      $stderr.print e
      raise TypeError, 'Invalid Format'
    end
  end

  def to(format)
    begin
      return @item::to(Formats::valueOf(format.upcase))
    rescue Exception => e
      $stderr.print e
      raise TypeError, 'Invalid Format'
    end
  end
end