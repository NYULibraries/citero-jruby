require "test_helper"

class CSLTest < Test::Unit::TestCase
  def test_if_styles_are_present
    assert Citero.citation_styles.include? "mla"
    assert Citero.citation_styles.include? "chicago_author_date"
    assert Citero.citation_styles.include? "apa"
  end
  
  def test_conversion_to_styles
    Citero.citation_styles.each {|style| assert Citero.map("itemType: book").from_csf.respond_to? "to_#{style}".to_sym}
  end
end