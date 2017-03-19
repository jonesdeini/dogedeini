require_relative "helper"
#require_relative "../lib/dogedeini/item_id_finder"

class ItemIdFinderTest < MiniTest::Unit::TestCase
  def mobile_stock_fixture
    File.open(File.expand_path("test/support/mobile_stock.json"), "r").read
  end

  def test_derp
    subject = ItemFinder.run!(mobile_stock_fixture, "doge")

    results = subject.map{|x| x['id'] }.uniq

    assert_equal(results.size, 1)
    assert_equal(results.first, 1026)
  end
end
