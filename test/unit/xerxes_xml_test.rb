require "test_helper"
  
class XerxesXmlTest < Test::Unit::TestCase
  def test_CSFinXerxesXMLOut
    assert_raise( NoMethodError ){  Citero.map($CSF).from_csf.to_xerxes_xml }
  end

  def test_RISinXerxesXMLOut
    assert_raise( NoMethodError ){  Citero.map($RIS).from_ris.to_xerxes_xml }
  end

  def test_PNXinXerxesXMLOut
    assert_raise( NoMethodError ){  Citero.map($PNX).from_pnx.to_xerxes_xml }
  end

  def test_BIBTEXinXerxesXMLOut
    assert_raise( NoMethodError ){  Citero.map($BIBTEX).from_bibtex.to_xerxes_xml }
  end

  def test_OPENURLinXerxesXMLOut
    assert_raise( NoMethodError ){  Citero.map($OPENURL).from_openurl.to_xerxes_xml }
  end
  
  def test_EASYBIBinXerxesXMLOut
    assert_raise( NoMethodError ){  Citero.map($EASYBIB).from_easybib.to_xerxes_xml }
  end
    
  def test_XerxesXMLinXerxesXMLOut
    assert_raise( NoMethodError ){  Citero.map($XERXES).from_xerxes_xml.to_xerxes_xml }
  end
end