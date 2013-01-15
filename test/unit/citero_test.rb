require "test_helper"

class CiteroTest < Test::Unit::TestCase
  def test_testUnrecognizedFromFormat
    assert_raise( NoMethodError ) { Citero.map("").from_unknown }
  end

  def test_testUnrecognizedToFormat
    assert_raise( NoMethodError ) { Citero.map($OPENURL).from_openurl.to_unknown }
  end

  def test_testUnmatchedData
    assert_raise( TypeError ) { Citero.map("").from_openurl.to_openurl }
  end

  def test_missingFromFormat
    assert_raise( ArgumentError ) { Citero.map("").to_openurl }
  end
  
  def test_missingToFormat
    assert_raise( NoMethodError ) { Citero.map($OPENURL).from_openurl.to }
  end
  
  def test_sourceFormats
    assert_raise( NoMethodError ) { Citero.map("").to_format }
  end
end
