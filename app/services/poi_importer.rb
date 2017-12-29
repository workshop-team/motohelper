# frozen_string_literal: true

require 'csv'

class PoiImporter
  def import_from_csv(path_to_csv, kind)
    CSV.foreach(path_to_csv) do |row|
      if find_poi(row[0], row[1])
        puts 'Already exist'
      else
        create(row[0], row[1], kind)
      end
    end
  end

  private

  def find_poi(longitude, latitude)
    Workshop.find_by(longitude: longitude, latitude: latitude)
  end

  def create(longitude, latitude, kind)
    if longitude.nil? || latitude.nil?
      puts 'Not imported: missing attributes'
    else
      Workshop.create(kind: kind, longitude: longitude, latitude: latitude)
      puts "Created: kind: #{kind}, longitude: #{longitude}, latitude: #{latitude}"
    end
  end
end
