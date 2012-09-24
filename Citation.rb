require 'java'
require ENV['CITATION']
Dir[ENV['M2_HOME'] + '/repository/**/*.jar'].each { |f| require f }
java_import Java::EduNyuLibraryCitation::Citation
java_import Java::edu.nyu.library.citation.Formats  
tool = Citation.new("itemType: journalArticle\nauthor: Me",Formats::CSF).output(Formats::OPENURL)
puts tool