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
  
  def test_CSF_object_from_csf
    test = Citero::CSF.new($CSF)
    assert test.itemType.first == "book"
    assert test.keys.first == "itemType"
  end
  
  def test_CSF_object_from_another_format
    test = Citero.map($RIS).from_ris.csf
    assert test.itemType.first == "journalArticle"
    assert test.keys.first == "itemType"
  end
end