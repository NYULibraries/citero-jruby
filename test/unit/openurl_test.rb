require "test_helper"
  
class OPENURLTest < Test::Unit::TestCase
  def test_CSFinOPENURLOut
    assert_match( $OPENURL_REGEX, Citero.map($CSF).from_csf.to_openurl )
  end

  def test_RISinOPENURLOut
    assert_match( $OPENURL_REGEX, Citero.map($RIS).from_ris.to_openurl )
  end

  def test_PNXinOPENURLOut
    assert_match( $OPENURL_REGEX, Citero.map($PNX).from_pnx.to_openurl )
  end

  def test_BIBTEXinOPENURLOut
    assert_match( $OPENURL_REGEX, Citero.map($BIBTEX).from_bibtex.to_openurl )
  end

  def test_OPENURLinOPENURLOut
    assert_match( $OPENURL_REGEX, Citero.map($OPENURL).from_openurl.to_openurl )
  end
  
  def test_EASYBIBinOPENURLOut
    assert_raise( NoMethodError ){  Citero.map($EASYBIB).from_easybib.to_openurl }
  end
  
  def test_XerxesXMLinOPENURLOut
    assert_match( $OPENURL_REGEX, Citero.map($XERXES).from_xerxes_xml.to_openurl )
  end
end