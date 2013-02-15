Given /^the following (.+) exists?:$/ do |factory_name, table|
  table.hashes.each do |attributes|
    attributes.keys.each do |key|
      attributes[key.parameterize.underscore] = attributes.delete(key)
    end
    name = factory_name.singularize.gsub(/ /,'_').to_sym
    FactoryGirl.create(name, attributes)
  end
end
