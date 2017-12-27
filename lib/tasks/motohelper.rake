# frozen_string_literal: true

namespace :motohelper do
  desc 'Loads sample data like users, cars, reminders, manintenances'
  task load_sample_data: :environment do
    SampleData.new.perform
  end

  desc 'Import workshops from POI (CSV). Run: motohelper:import_poi[\'poi/Serwis Audi.csv, audi\']'
  task :import_poi, [:path, :kind] => :environment do |t, args|
    CsvImporter.import_from_csv(args[:path], args[:kind])
  end

end
