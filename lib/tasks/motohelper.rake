# frozen_string_literal: true

namespace :motohelper do
  desc 'Loads sample data like users, cars, reminders, manintenances'
  task load_sample_data: :environment do
    SampleData.new.perform
  end
end
