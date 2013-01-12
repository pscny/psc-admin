namespace :psc do
  namespace :dev do
    task :ensure_non_production_environment => :environment do
      raise "You cannot run this task in a production environment. Aborting..." if Rails.env.production?
    end

    desc "Creates some sample data for testing locally"
    task :prime => [:ensure_non_production_environment, 'mongo:drop']  do
      require 'factory_girl_rails'

      ActiveSupport::Notifications.subscribe("factory_girl.run_factory") do |name, start, finish, id, payload|
        $stdout.print('.')
        $stdout.flush
      end

      print "Creating development data..."

      FactoryGirl.create(:admin, :email    => 'admin@example.com',
                                 :password => 'test')

      print "done.\n"
    end
  end
end
