# frozen_string_literal: true

require 'csv'

class PoiImporter
  def import_single_file(path_to_csv, kind)
    rows = []
    CSV.foreach(path_to_csv) do |row|
      longitude = row[0]
      latitude = row[1]
      unless find_poi(longitude, latitude, kind)
        rows.push(longitude: longitude, latitude: latitude, kind: kind) unless longitude.nil? || latitude.nil?
      end
    end
    create(get_workshops_from_api(rows), path_to_csv)
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

  def get_workshops_from_api(workshops)
    updated_workshops = []
    workshops.each do |workshop|
      places = GoogleApi.get_workshops_with_details(workshop[:latitude], workshop[:longitude])
      updated_workshops << match_workshop(workshop[:latitude], workshop[:longitude], workshop[:kind], places)
    end
    updated_workshops
  end

  def match_workshop(latitude, longitude, kind, places)
    case places.count
    when 0
      { latitude: latitude, longitude: longitude, kind: kind }
    when 1
      attributes(places.first, latitude, longitude, kind)
    else
      find_workshop_by_name(places, latitude, longitude, kind)
    end
  end

  def attributes(place, latitude, longitude, kind)
    {
      latitude: latitude,
      longitude: longitude,
      kind: kind,
      rating: place['rating'],
      place_id: place['place_id'],
      name: place['name'],
      adress: place['formatted_address'],
      phone: place['formatted_phone_number']
    }
  end

  def find_workshop_by_name(places, latitude, longitude, kind)
    places.each do |place|
      return attributes(place, latitude, longitude, kind) if place['name'].downcase.include? kind.chop
      return { latitude: latitude, longitude: longitude, kind: kind }
    end
  end

  def find_kind(file_name)
    Workshop.kinds.each_key do |kind|
      return kind if file_name.downcase.include? kind
    end
  end

  def find_poi(longitude, latitude, kind)
    Workshop.exists?(longitude: longitude, latitude: latitude, kind: kind)
  end

  def count_csv(path_to_csv)
    CSV.read(path_to_csv).count
  end

  def create(rows, path_to_csv)
    Workshop.create(rows)
    puts "Imported: #{rows.count} / #{count_csv(path_to_csv)} workshops"
  end
end
