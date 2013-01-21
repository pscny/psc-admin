Given /^the following (.+[^s])s? exists?:$/ do |factory_name, table|
  table.hashes.each do |attributes|
    attributes.keys.each do |key|
      attributes[key.parameterize.underscore] = attributes.delete(key)
    end
    FactoryGirl.create(factory_name, attributes)
  end
end
