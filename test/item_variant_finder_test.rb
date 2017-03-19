require_relative "helper"

class ItemVariantFinderTest < MiniTest::Unit::TestCase
  def mobile_stock_fixture
    File.open(File.expand_path("test/support/item.json"), "r").read
  end

  def test_derp
    subject = ItemVariantFinder.run!(mobile_stock_fixture, "black", "large")

    results = subject.map{|x| x['id'] }.uniq

    assert_equal(results.size, 1)
    assert_equal(results.first, 1026)
  end
end
