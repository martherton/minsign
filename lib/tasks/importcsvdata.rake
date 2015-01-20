namespace :csvimport do

  desc "Import CSV Data."
  task :import_csv_data => :environment do

    require 'csv'

    csv_file_path = '/Users/Mark/Modulecsv/Exchanges1.csv'

    CSV.foreach(csv_file_path) do |row|

      w = Wlink.create!({
          :wlinkname => row[0],
          :wlinkurl => row[1],
          :wlinkdesc => row[2],
          :wlinkveri => row[3],
          :user_id => row[4],
          :linkcat_id => row[5],
          :wlinksource => row[6],
          :wlinkyear => row[7],
          :wlinklang => row[8],
          :tag_list => row[9].split('|'),

        }
      )

    end

  end

end