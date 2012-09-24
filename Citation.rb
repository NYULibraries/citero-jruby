require 'java'
Dir[ENV['CITATION'] + '/*.jar'].each {|f| require f}
Dir[ENV['M2_HOME'] + '/repository/**/*.jar'].each do |f|
  puts f
  require f
end
java_import Java::EduNyuLibraryCitation::Citation
java_import Java::edu.nyu.library.citation.Formats  
tool = Citation.new("itemType: journalArticle\nauthor: Me",Formats::CSF).output(Formats::OPENURL)
puts tool