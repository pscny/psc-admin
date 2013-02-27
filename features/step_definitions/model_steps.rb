Given /^the following (.+) exists?:$/ do |factory_name, table|
  table.hashes.each do |attributes|
    attributes.keys.each do |key|
      attributes[key.parameterize.underscore] = attributes.delete(key)
    end
    name = factory_name.singularize.gsub(/ /,'_').to_sym

    associations = attributes.select do |key, value|
      value.match(/:/)
    end

    associations = associations.map do |key, value|
      field, value = *(value.split(':'))
      { key => { field => value } }
    end

    model = FactoryGirl.create(name, attributes)
    associations.each do |association|
      field  = association.keys.first
      params = association.values.first
      model.send("#{field}=", FactoryGirl.create(field, params))
    end
  end
end
