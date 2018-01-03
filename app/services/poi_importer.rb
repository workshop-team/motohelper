# frozen_string_literal: true

require 'csv'

class PoiImporter
  def import_from_csv(path_to_csv, kind)
    rows = []
    exist = []
    CSV.foreach(path_to_csv) do |row|
      longitude = row[0]
      latitude = row[1]
      if find_poi(longitude, latitude)
        exist.push({longitude: longitude, latitude: latitude, kind: kind})
      else
        rows.push({longitude: longitude, latitude: latitude, kind: kind}) unless longitude.nil? || latitude.nil?
      end
    end
    puts "Already exist: #{exist.count} workshops"
    create(rows)
  end

  def import_all_files(path)
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

  def find_kind(file_name)
    Workshop.kinds.each_key do |kind|
      return kind if file_name.downcase.include? kind
    end
  end

  def find_poi(longitude, latitude)
    Workshop.exists?(longitude: longitude, latitude: latitude)
  end

  def create(rows)
    Workshop.create(rows)
    puts "Imported: #{rows.count} workshops"
  end
end
