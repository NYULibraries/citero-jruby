require "test_helper"

class CSFTest < Test::Unit::TestCase
  def test_test_CSFinCSFOut
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
end