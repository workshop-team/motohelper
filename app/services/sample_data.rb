# frozen_string_literal: true

class SampleData
  def perform
    puts 'Start inserting sample data...'

    10.times do
      @user = RegularUser.create!(
        name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password
      )
      puts ".#{@user.name}"
      add_cars
    end

    puts 'Mission complete :)'
  end

  def add_cars
    rand(1..4).times do
      @mileage = rand(50_000..200_000)
      @car_date = Date.today - 2.months
      @fancy_car = DataSets.brand_model
      puts "..#{@fancy_car}"

      add_car
      add_reminders
      add_maintenances
    end
  end

  def add_car
    @car = @user.cars.create!(
      registration_number: DataSets.registration_number, brand: @fancy_car[:brand], model: @fancy_car[:model]
    )
  end

  def add_reminders
    rand(1..10).times do
      next_period

      @car.reminders.create!(
        name: DataSets.reminder, reminder_date: @car_date, mileage: @mileage, note: Faker::ChuckNorris.fact
      )
    end
  end

  def add_maintenances
    rand(1..15).times do
      next_period

      @car.maintenances.create!(
        name: DataSets.maintenance, mileage: @mileage, warranty_date: @car_date, note: Faker::ChuckNorris.fact
      )
    end
  end

  def next_period
    @mileage += rand(100..500)
    @car_date += rand(5..10).days
  end
end
