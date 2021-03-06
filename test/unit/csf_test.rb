require "test_helper"

class CSFTest < Test::Unit::TestCase
  def test_CSFinCSFOut
    assert_match( $CSF_REGEX, Citero.map($CSF).from_csf.to_csf )
  end

  def test_test_RISinCSFOut
    assert_match( $CSF_REGEX, Citero.map($RIS).from_ris.to_csf )
  end

  def test_PNXinCSFOut
    assert_match( $CSF_REGEX, Citero.map($PNX).from_pnx.to_csf )
  end

  def test_BIBTEXinCSFOut
    assert_match( $CSF_REGEX, Citero.map($BIBTEX).from_bibtex.to_csf )
  end

  def test_OPENURLinCSFOut
    assert_match( $CSF_REGEX, Citero.map($OPENURL).from_openurl.to_csf )
  end
  
  def test_EASYBIBinCSFOut
    assert_raise( NoMethodError ){  Citero.map($EASYBIB).from_easybib.to_csf }
  end
  
  def test_XerxesXMLinXerxesXMLOut
    assert_match( $CSF_REGEX, Citero.map($XERXES).from_xerxes_xml.to_csf )
  end
  
  def test_CSF_object_from_csf
    test = Citero::CSF.new($CSF)
    assert test.respond_to? "item_type".to_sym
    assert test.item_type.first == "book"
    assert_equal "item_type", test.keys.first
    assert !(test.respond_to? "no_method".to_sym)
    assert_raise( NoMethodError ){ test.no_method }
  end
  
  def test_CSF_object_from_another_format
    test = Citero.map($RIS).from_ris.csf
    assert test.item_type.first == "journalArticle"
    assert test.keys.first == "item_type"
  end
  
  def test_CSF_object_without_source
    assert_raise( ArgumentError ){ Citero.map("").csf }
  end
end