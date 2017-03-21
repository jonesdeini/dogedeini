require_relative "helper"
require_relative "../lib/dogedeini/item_variant_finder"

class ItemVariantFinderTest < MiniTest::Test
  def item_fixture
    File.open(File.expand_path("test/support/item.json"), "r").read
  end

  def test_when_colorway_and_size_are_unique_large
    subject = ItemVariantFinder.run!(item_fixture, "camo", "large")

    results = subject.map{|x| x['id'] }.uniq

    assert_equal(results.size, 1)
    assert_equal(results.first, 1026)
  end

  def test_when_colorway_and_size_are_unique_xlarge
    subject = ItemVariantFinder.run!(item_fixture, "camo", "xlarge")

    results = subject.map{|x| x['id'] }.uniq

    assert_equal(results.size, 1)
    assert_equal(results.first, 6201)
  end

  def test_protect_myself_from_being_dumb_with_downcase
    subject = ItemVariantFinder.run!(item_fixture, "cAmO", "xLaRge")

    results = subject.map{|x| x['id'] }.uniq

    assert_equal(results.size, 1)
    assert_equal(results.first, 6201)
  end

  def test_when_colorway_is_not_unique
    error = assert_raises(RuntimeError) do
      ItemVariantFinder.run!(item_fixture, "derp", "large")
    end
    assert_equal(error.message, "found 3 items for colorway: derp")
  end
end
