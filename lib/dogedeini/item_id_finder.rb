require 'json'

class ItemFinder
  def self.run!(inventory_response, keyword)
    inventory_json = JSON.parse(inventory_response)['products_and_categories'] #['new']
    inventory_json = inventory_json.values.flatten
    inventory_json.select { |json| json['name'].downcase.include? keyword.downcase }
  end
end
