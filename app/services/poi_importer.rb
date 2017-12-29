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
