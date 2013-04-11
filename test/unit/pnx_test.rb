require "test_helper"
  
class PNXTest < Test::Unit::TestCase
  def test_CSFinPNXOut
    assert_raise( NoMethodError ){  Citero.map($CSF).from_csf.to_pnx }
  end

  def test_RISinPNXOut
    assert_raise( NoMethodError ){  Citero.map($RIS).from_ris.to_pnx }
  end

  def test_PNXinPNXOut
    assert_raise( NoMethodError ){  Citero.map($PNX).from_pnx.to_pnx }
  end

  def test_BIBTEXinPNXOut
    assert_raise( NoMethodError ){  Citero.map($BIBTEX).from_bibtex.to_pnx }
  end

  def test_OPENURLinPNXOut
    assert_raise( NoMethodError ){  Citero.map($OPENURL).from_openurl.to_pnx }
  end
  
  def test_EASYBIBinPNXOut
    assert_raise( NoMethodError ){  Citero.map($EASYBIB).from_easybib.to_pnx }
  end
  
  def test_XerxesXMLinPNXOut
    assert_raise( NoMethodError ){  Citero.map($XERXES).from_xerxes_xml.to_pnx }
  end
end