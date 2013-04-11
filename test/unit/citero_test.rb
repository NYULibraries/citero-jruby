require "test_helper"

class CiteroTest < Test::Unit::TestCase
  def test_UnrecognizedFromFormat
    assert_raise( NoMethodError ) { Citero.map("").from_unknown }
  end

  def test_UnrecognizedToFormat
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
  
  def test_cant_call_to_before_from
    assert_raise( ArgumentError ) { Citero.map("").to_ris }
  end
  
  def test_if_responds_to_and_from
    Citero.to_formats.each {|format| assert Citero.map("").respond_to?("to_#{format}".to_sym)}
    Citero.from_formats.each {|format| assert Citero.map("").respond_to?("from_#{format}".to_sym)}
  end
  
  def test_if_doesnt_respond
    assert !Citero.map("").respond_to?("to_pnx".to_sym)
    assert !Citero.map("").respond_to?("from_easybib}".to_sym)
  end
end
