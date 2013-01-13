namespace :mongo do
  desc "Drop the current database"
  task :drop => ["psc:dev:ensure_non_production_environment", :environment] do
    Mongoid.default_session.drop
  end
end
