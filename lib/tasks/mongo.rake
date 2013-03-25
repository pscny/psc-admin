namespace :mongo do
  desc "Drop the current database"
  task :drop => ['psc:dev:production_warning', :environment] do
    Mongoid.default_session.collections.each(&:drop)
  end
end
