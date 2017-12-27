# frozen_string_literal: true
require 'csv'

class CsvImporter

  def self.import_from_csv(path_to_csv, kind)
    CSV.foreach(path_to_csv) do |row|
      create(row, kind)
    end
  end

  private
  def self.create(row, kind)
    puts "Creating: kind: #{kind}, longitude: #{row[0]}, latitude: #{row[1]}"
    Workshop.create(kind: kind, longitude: row[0], latitude: row[1])
  end
end
