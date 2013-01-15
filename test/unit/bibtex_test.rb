require "test_helper"
  
class BIBTEXTest < Test::Unit::TestCase
  def test_CSFinBIBTEXOut
    assert_match( $BIBTEX_REGEX, Citero.map($CSF).from_csf.to_bibtex )
  end

  def test_RISinBIBTEXOut
    assert_match( $BIBTEX_REGEX, Citero.map($RIS).from_ris.to_bibtex )
  end

  def test_PNXinBIBTEXOut
    assert_match( $BIBTEX_REGEX, Citero.map($PNX).from_pnx.to_bibtex )
  end

  def test_BIBTEXinBIBTEXOut
    assert_match( $BIBTEX_REGEX, Citero.map($BIBTEX).from_bibtex.to_bibtex )
  end

  def test_OPENURLinBIBTEXOut
    assert_match( $BIBTEX_REGEX, Citero.map($OPENURL).from_openurl.to_bibtex )
  end
end