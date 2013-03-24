namespace :psc do
  namespace :dev do
    task :ensure_non_production_environment => :environment do
      raise "You cannot run this task in a production environment. Aborting..." if Rails.env.production?
    end

    task :production_warning => :environment do
      if Rails.env.production?
        puts "\d"
        puts "Warning: This task is being run in production."
        puts "Warning: This could have unwanted consequences."
        puts "\d"
      end
    end

    desc "Creates some sample data for testing locally"
    task :prime => [:ensure_non_production_environment, 'mongo:drop']  do
      require 'factory_girl_rails'
      require 'faker'

      ActiveSupport::Notifications.subscribe("factory_girl.run_factory") do |name, start, finish, id, payload|
        $stdout.print('.')
        $stdout.flush
      end

      print "Creating development data..."

      concerts = [
        { :name    => 'Arens',
          :concerts => [
            { :date => 'Oct 20, 2012',   :name => 'MFM I'            },
            { :date => 'Nov 17, 2012',   :name => 'Morgenstern Trio' },
            { :date => 'Feb 9, 2013',    :name => 'Emanuel Ax'       },
            { :date => 'March 16, 2013', :name => 'ECCO'             },
            { :date => 'March 23, 2013', :name => 'Vadim Gluzman'    },
            { :date => 'May 11, 2013',   :name => 'MFM III'          }
          ]
        },
        { :name    => 'Mann',
          :concerts => [
            { :date => 'Nov 10, 2012',   :name => 'Pacifica Quartet'           },
            { :date => 'Dec 15, 2012',   :name => 'PF and Guarneri (Brentano)' },
            { :date => 'March 9, 2013',  :name => 'MFM II'                     },
            { :date => 'April 6, 2013',  :name => 'Juilliard Quartet'          },
            { :date => 'April 20, 2013', :name => 'Ebene Quartet'              },
            { :date => 'April 27, 2013', :name => 'Vladimir Feltsman'          }
          ]
        },
        { :name    => 'Festival',
          :concerts => [
            { :date => 'Nov 4, 2012',    :name => 'Horszowski Trio'              },
            { :date => 'Dec 9, 2012',    :name => 'Goode and Shafer'             },
            { :date => 'March 24, 2013', :name => 'Yevgeny Sudbin'               },
            { :date => 'Apr 7, 2013',    :name => 'Johannes Quartet'             },
            { :date => 'Apr 14, 2013',   :name => 'Balsom and Scottish Ensemble' },
            { :date => 'May 5, 2013',    :name => 'Rafal Blechacz'               }
          ]
        }
      ]

      concerts.each do |series|
        cs = ConcertSeries.create(:name => series[:name])
        series[:concerts].each do |concert|
          cs.concerts.create(concert)
        end
      end

      30.times do
        FactoryGirl.create(:member)
      end

      print "done.\n"
    end
  end
end
