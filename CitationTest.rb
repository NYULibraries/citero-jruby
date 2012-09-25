require "Citation"
require "test/unit"

$CSF = "itemType: book\nauthor: Alexander Dumas\ncontributor: D'Artagnan\ntitle: The Three Musketeers"
$RIS = "TY  -  JOUR\nAU  -  Shannon,Claude E.\nER  -\n\n"
$PNX = "<display>" + "<type>book</type>"
+ "<title>"
+ "Information literacy : infiltrating the agenda, challenging minds"
+ "</title>"
+ "<contributor>Geoff Walton (Geoff L.); Alison Pope</contributor>"
+ "<publisher>Oxford : Chandos Publishing</publisher>"
+ "<creationdate>2011</creationdate>"
+ "<format>xxvi, 294 p. ; 24 cm.</format>"
+ "<identifier>$$Cisbn$$V1843346109; $$Cisbn$$V9781843346104</identifier>"
+ "<subject>"
+ "Information literacy; Information literacy -- Study and teaching; Information literacy -- Web-based instruction; Library orientation for graduate students; Information services -- User education"
+ "</subject>"
+ "<description>"
+ "$$Ccontents$$VIntroduction / Alison Pope and Geoff Walton -- Information literate pedagogy : developing a levels framework for the Open University / Katharine Reedy and Kirsty Baker -- Information literacy in the workplace and the employablity agenda / John Crawford and Christine Irving -- Information literacy in the context of contemporary teaching methods in higher education / Chris Wakeman -- 'Enquiring Minds' and the role of information literacy in the design, management and assessment of student research tasks / Keith Puttick -- Are we sharing our toys in the sandpit? Issues surrounding the design, creation, reuse and re-purposing of learning objects to support information skills and teaching? / Nancy Graham -- Spielburg your way to information literacy : producing educational movies and videos / Gareth Johnson -- Information literacy and noö̈politics / Andrew Whitworth -- Contemporary technologies' influence on learning as a social practice / Ben Scoble -- Understanding the information literacy competencies of UK Higher Education students / Jillian R. Griffiths and Bob Glass."
+ "</description>"
+ "<language>eng</language>"
+ "<relation>"
+ "$$Cseries $$VChandos information professional series"
+ "</relation>"
+ "<source>nyu_aleph</source>"
+ "<availlibrary>"
+ "$$INYU$$LBOBST$$1Main Collection$$2(ZA3075 .I54 2011 )$$Savailable$$31$$40$$5N$$60$$XNYU50$$YBOBST$$ZMAIN"
+ "</availlibrary>"
+ "<lds02>nyu_aleph003522839</lds02>"
+ "<lds01>NYU</lds01>"
+ "<availinstitution>$$INYU$$Savailable</availinstitution>"
+ "<availpnx>available</availpnx>"
+ "</display>"
$BIBTEX = "@article{Adams2001,\nauthor = {Adams, Nancy K and DeSilva, Shanaka L and Self, Steven and Salas, Guido and Schubring, Steven and Permenter, Jason L and Arbesman, Kendra},\nfile = {:Users/heatherwright/Documents/Scientific Papers/Adams\\_Huaynaputina.pdf:pdf;::},\njournal = {Bulletin of Volcanology},\nkeywords = {Vulcanian eruptions,breadcrust,plinian},\npages = {493--518},\ntitle = {{The physical volcanology of the 1600 eruption of Huaynaputina, southern Peru}},\nvolume = {62},\nyear = {2001}\n}"
$OPENURL = "https://getit.library.nyu.edu/resolve?url_ver=Z39.88-2004&rft_val_fmt=info:ofi/fmt:kev:mtx:book&rft.isbn=0836218310&rft.btitle=The+Far+Side+Gallery+3&rft.au=Gary+Larson"

$CSF_REGEX = /(^[.a-zA-Z0-9]+(\s*:\s*)[^\n]+$)+/
$RIS_REGEX = /(^[\w\d]{1,6}  - [\w\W]*$|\s)+/
$PNX_REGEX = /<[\w\W]*><[\w\s"]+>[\w\W]*<\/[\w\s]+>/
$BIBTEX_REGEX = /@[^\{]+\{(?:[^\{\}]|\{[^\{\}]*\})*\}/
$OPENURL_REGEX = /[:\/%$\-_\.\+!\*'\(\),a-zA-Z0-9]*\?[&?[:\/%$\-_\.\+!\*'\(\),a-zA-Z0-9]+=[:\/%$\-_\.\+!\*'\(\),a-zA-Z0-9]+]+/

class CSFTest < Test::Unit::TestCase
  def CSFinCSFOutTest
    assert_match( $CSF_REGEX, Citation.new.map($CSF).from("csf").to("csf") )
  end

  def RISinCSFOutTest
    assert_match( $CSF_REGEX, Citation.new.map($RIS).from("ris").to("csf") )
  end

  def PNXinCSFOutTest
    assert_match( $CSF_REGEX, Citation.new.map($PNX).from("pnx").to("csf") )
  end

  def BIBTEXinCSFOutTest
    assert_match( $CSF_REGEX, Citation.new.map($BIBTEX).from("bibtex").to("csf") )
  end

  def OPENURLinCSFOutTest
    assert_match( $CSF_REGEX, Citation.new.map($OPENURL).from("openurl").to("csf") )
  end
end

class RISTest < Test::Unit::TestCase
  def CSFinRISOutTest
    assert_match( $RIS_REGEX, Citation.new.map($CSF).from("csf").to("ris") )
  end

  def RISinRISOutTest
    assert_match( $RIS_REGEX, Citation.new.map($RIS).from("ris").to("ris") )
  end

  def PNXinRISOutTest
    assert_match( $RIS_REGEX, Citation.new.map($PNX).from("pnx").to("ris") )
  end

  def BIBTEXinRISOutTest
    assert_match( $RIS_REGEX, Citation.new.map($BIBTEX).from("bibtex").to("ris") )
  end

  def OPENURLinRISOutTest
    assert_match( $RIS_REGEX, Citation.new.map($OPENURL).from("openurl").to("ris") )
  end
end

class PNXTest < Test::Unit::TestCase
  def CSFinPNXOutTest
    assert_match( $PNX_REGEX, Citation.new.map($CSF).from("csf").to("pnx") )
  end

  def RISinPNXOutTest
    assert_match( $PNX_REGEX, Citation.new.map($RIS).from("ris").to("pnx") )
  end

  def PNXinPNXOutTest
    assert_match( $PNX_REGEX, Citation.new.map($PNX).from("pnx").to("pnx") )
  end

  def BIBTEXinPNXOutTest
    assert_match( $PNX_REGEX, Citation.new.map($BIBTEX).from("bibtex").to("pnx") )
  end

  def OPENURLinPNXOutTest
    assert_match( $PNX_REGEX, Citation.new.map($OPENURL).from("openurl").to("pnx") )
  end
end

class BIBTEXTest < Test::Unit::TestCase
  def CSFinBIBTEXOutTest
    assert_match( $BIBTEX_REGEX, Citation.new.map($CSF).from("csf").to("bibtex") )
  end

  def RISinBIBTEXOutTest
    assert_match( $BIBTEX_REGEX, Citation.new.map($RIS).from("ris").to("bibtex") )
  end

  def PNXinBIBTEXOutTest
    assert_match( $BIBTEX_REGEX, Citation.new.map($PNX).from("pnx").to("bibtex") )
  end

  def BIBTEXinBIBTEXOutTest
    assert_match( $BIBTEX_REGEX, Citation.new.map($BIBTEX).from("bibtex").to("bibtex") )
  end

  def OPENURLinBIBTEXOutTest
    assert_match( $BIBTEX_REGEX, Citation.new.map($OPENURL).from("openurl").to("bibtex") )
  end
end

class OPENURLTest < Test::Unit::TestCase
  def CSFinOPENURLOutTest
    assert_match( $OPENURL_REGEX, Citation.new.map($CSF).from("csf").to("openurl") )
  end

  def RISinOPENURLOutTest
    assert_match( $OPENURL_REGEX, Citation.new.map($RIS).from("ris").to("openurl") )
  end

  def PNXinOPENURLOutTest
    assert_match( $OPENURL_REGEX, Citation.new.map($PNX).from("pnx").to("openurl") )
  end

  def BIBTEXinOPENURLOutTest
    assert_match( $OPENURL_REGEX, Citation.new.map($BIBTEX).from("bibtex").to("openurl") )
  end

  def OPENURLinOPENURLOutTest
    assert_match( $OPENURL_REGEX, Citation.new.map($OPENURL).from("openurl").to("openurl") )
  end
end

class CitationTest < Test::Unit::TestCase
  def testUnrecognizedFromFormat
    assert_raise( TypeError ) { Citation.new.map().from("unknown") }
  end

  def testUnrecognizedToFormat
    assert_raise( TypeError ) { Citation.new.map().from("openurl").to("unkown") }
  end

  def testUnmatchedData
    assert_raise( TypeError ) { Citation.new.map("").from("openurl").to("openurl") }
  end

  def missingFromFormat
    assert_raise( TypeError ) { Citation.new.map().to("openurl") }
  end

  def missingToFormat
    assert_raise( TypeError ) { Citation.new.map().from("openurl").to("") }
  end
end