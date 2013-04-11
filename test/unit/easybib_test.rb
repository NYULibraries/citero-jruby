require "test_helper"
  
class EASYBIBTest < Test::Unit::TestCase
  def test_CSFinEASYBIBOut
    assert_true( is_valid_json? Citero.map($CSF).from_csf.to_easybib )
  end                                  
                                       
  def test_RISinEASYBIBOut              
    assert_true( is_valid_json? Citero.map($RIS).from_ris.to_easybib )
  end                                  
                                       
  def test_PNXinEASYBIBOut              
    assert_true( is_valid_json? Citero.map($PNX).from_pnx.to_easybib )
  end                                  
                                       
  def test_BIBTEXinEASYBIBOut           
    assert_true( is_valid_json? Citero.map($BIBTEX).from_bibtex.to_easybib )
  end                                  
                                       
  def test_OPENURLinEASYBIBOut          
    assert_true( is_valid_json? Citero.map($OPENURL).from_openurl.to_easybib )
  end
  
  def test_EASYBIBinEASYBIBOut
    assert_raise( NoMethodError ){  Citero.map($EASYBIB).from_easybib.to_easybib }
  end

  def test_XerxesXMLinEASYBIBOut
    assert_true( is_valid_json? Citero.map($XERXES).from_xerxes_xml.to_easybib )
  end
end