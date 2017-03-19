require 'json'

class ItemVariantFinder
  def self.run!(item_response, colorway, size)
    inventory_json = JSON.parse(item_response)['styles'] #['new']
    inventory_json = inventory_json.values.flatten
    x = inventory_json.select {|json| json['name'].downcase.include? colorway}
    puts x
  end
end
