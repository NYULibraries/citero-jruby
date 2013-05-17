require "test_helper"
  
class RefworksTaggedTest < Test::Unit::TestCase
  def test_CSFinREFWORKSTAGGEDout
    assert_match( $RIS_REGEX, Citero.map($CSF).from_csf.to_refworks_tagged )
  end

  def test_RISinREFWORKSTAGGEDout
    assert_match( $RIS_REGEX, Citero.map($RIS).from_ris.to_refworks_tagged )
  end

  def test_PNXinREFWORKSTAGGEDout
    assert_match( $RIS_REGEX, Citero.map($PNX).from_pnx.to_refworks_tagged )
  end

  def test_BIBTEXinREFWORKSTAGGEDout
    assert_match( $RIS_REGEX, Citero.map($BIBTEX).from_bibtex.to_refworks_tagged )
  end

  def test_OPENURLinREFWORKSTAGGEDout
    assert_match( $RIS_REGEX, Citero.map($OPENURL).from_openurl.to_refworks_tagged )
  end
  
  def test_EASYBIBinREFWORKSTAGGEDout
    assert_raise( NoMethodError ){  Citero.map($EASYBIB).from_easybib.to_refworks_tagged }
  end
  
  def test_XerxesXMLinREFWORKSTAGGEDout
    assert_match( $RIS_REGEX, Citero.map($XERXES).from_xerxes_xml.to_refworks_tagged )
  end
end