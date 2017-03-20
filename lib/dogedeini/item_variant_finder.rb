require 'json'

class ItemVariantFinder
  def self.run!(item_response, colorway, size)
    items_inventory_json = JSON.parse(item_response)['styles']
    items_for_color_way = items_inventory_json.select { |json| json['name'].downcase.include? colorway.downcase }
    if items_for_color_way.count == 1
      items_for_color_way.first.fetch('sizes', []).select { |json| json['name'].downcase == size.downcase }
    else
      raise "found #{items_for_color_way.count} items for colorway: #{colorway}"
    end
  end
end
