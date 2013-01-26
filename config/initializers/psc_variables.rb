module PscVariables
  STATES = YAML::load_file(File.join(Rails.root.to_s, 'config', 'states.yml')).freeze
end
