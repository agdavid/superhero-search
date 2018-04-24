require 'csv'

namespace :database do
  desc 'load superheroes from csv'
  task :load_superheroes => :environment do
    csv_names = ['dc-wikia-data.csv', 'marvel-wikia-data.csv']

    csv_names.each do |csv_name|
      csv_file = open "#{Rails.root}/db/data/comic-characters/#{csv_name}"
      csv_data = CSV.read csv_file

      headers = csv_data.shift.map {|header| header.dump.remove("\\u{feff}").gsub('"', "")}
      csv_data.map! { |row_values| [headers, row_values].transpose.to_h }

      csv_data.each_with_index do |data_hash, i|
        puts "====="
        puts "creating superhero #{i+1} of #{csv_data.size} from #{csv_name}"

        Superhero.where(name: data_hash['name'].split("(")[0].strip).first_or_create(
          urlslug: data_hash['urlslug'],
          id_status: data_hash['ID'].present? ? data_hash['ID'].chomp("Identity").strip : nil,
          alignment: data_hash['ALIGN'].present? ? data_hash['ALIGN'].chomp("Characters").strip : nil,
          eye: data_hash['EYE'].present? ? data_hash['EYE'].chomp("Eyes").strip : nil,
          hair: data_hash['HAIR'].present? ? data_hash['HAIR'].chomp("Hair").strip : nil,
          sex: data_hash['SEX'].present? ? data_hash['SEX'].chomp("Characters").strip : nil,
          appearances: data_hash['APPEARANCES'].present? ? data_hash['APPEARANCES'].to_i : nil,
          first_appearance: data_hash['Year'],
          universe: (csv_name.include?('marvel') ? 'marvel' : 'dc')
          )
      end

    end

  end
end
