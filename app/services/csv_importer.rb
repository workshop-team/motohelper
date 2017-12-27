# frozen_string_literal: true
require 'csv'

class CsvImporter
#  LATITUDE = row[1]
#  LONGITUDE = row[0]

  def import_from_csv(path_to_csv)
    CSV.foreach(path_to_csv) do |row|
      puts "Longitude #{row[0]}; Latitude #{row[1]} "
    end
  end
end
