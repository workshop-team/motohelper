# frozen_string_literal: true

require 'csv'

class PoiImporter
  def import_from_csv(path_to_csv, kind)
    rows = []
    CSV.foreach(path_to_csv) do |row|
      longitude = row[0]
      latitude = row[1]
      unless find_poi(longitude, latitude, kind)
        rows.push(longitude: longitude, latitude: latitude, kind: kind) unless longitude.nil? || latitude.nil?
      end
    end
    create(rows, path_to_csv)
  end

  def import_single_file(path)
    Dir.foreach(path) do |file|
      next if ['.', '..', '.DS_Store'].include? file
      if find_kind(file).is_a?(Hash)
        puts "# Bad filename: #{file} or kind not found. Use: rake motohelper:import_poi['#{path}#{file}, ..kind..'] #"
        next
      end
      puts "Importing #{file} :"
      import_from_csv(path + file, find_kind(file))
    end
  end

  private

  def count_csv(path_to_csv)
    CSV.read(path_to_csv).count
  end

  def find_kind(file_name)
    Workshop.kinds.each_key do |kind|
      return kind if file_name.downcase.include? kind
    end
  end

  def find_poi(longitude, latitude, kind)
    Workshop.exists?(longitude: longitude, latitude: latitude, kind: kind)
  end

  def create(rows, path_to_csv)
    Workshop.create(rows)
    puts "Imported: #{rows.count} / #{count_csv(path_to_csv)} workshops"
  end
end
