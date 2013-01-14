require "test_helper"
  
class RISTest < Test::Unit::TestCase
  def test_CSFinRISOut
    assert_match( $RIS_REGEX, Citero.map($CSF).from_csf.to_ris )
  end

  def test_RISinRISOut
    assert_match( $RIS_REGEX, Citero.map($RIS).from_ris.to_ris )
  end

  def test_PNXinRISOut
    assert_match( $RIS_REGEX, Citero.map($PNX).from_pnx.to_ris )
  end

  def test_BIBTEXinRISOut
    assert_match( $RIS_REGEX, Citero.map($BIBTEX).from_bibtex.to_ris )
  end

  def test_OPENURLinRISOut
    assert_match( $RIS_REGEX, Citero.map($OPENURL).from_openurl.to_ris )
  end
end