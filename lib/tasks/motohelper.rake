# frozen_string_literal: true

namespace :motohelper do
  desc 'Loads sample data like users, cars, reminders, manintenances'
  task load_sample_data: :environment do
    SampleData.new.generate
  end

  desc 'Import workshops from POI (CSV). Run: motohelper:import_poi[\'poi/Serwis Audi.csv, audi\']'
  task :import_poi, %i[path kind] => :environment do |_t, args|
    PoiImporter.new.import_from_csv(args[:path], args[:kind])
  end

  desc 'Import all POI files from path. Run: motohelper:import_all_poi[\'poi/\']'
  task :import_all_poi, [:path] => :environment do |_t, args|
    PoiImporter.new.import_all_files(args[:path])
  end
end
