# frozen_string_literal: false

class DataSets
  def self.brand_model
    cars = {
      'Audi': %w[100 CC A6 A4],
      'Volkswagen': %w[Golf Polo Passat Bora],
      'Volvo': %w[244 740 S80],
      'Mercedes-Benz': %w[CL S W124 CLS],
      'Trabant': %w[601 P\ 50]
    }

    brand_index = rand(0...(cars.keys.size))

    { brand: cars.keys[brand_index].to_s, model: cars.values[brand_index].sample }
  end

  def self.registration_number
    letter_array = ('A'..'Z').to_a

    ''.tap do |rn|
      3.times { rn << letter_array.sample }
      rn << ' '
      4.times { rn << rand(1..9).to_s }
    end
  end

  def self.reminder
    operations = %w[
      wymiana\ opon remont\ silnika
      zapłata\ za\ ubezpieczenie przegląd\ techniczny
      promocji\ na\ spryskiwacz\ malinowy
      rejestracja\ haku
      myjnia\ u\ Henia
      naprawa\ alarmu\ u\ Mariusza
      montaż\ bagażnika\ na\ narty
    ]

    operations.sample
  end

  def self.maintenance
    operation = %w[wymiana naprawa sprawdzenie]
    part = %w[
      pompy\ wtryskowej gaźnika chłodnicy silnika szkrzyni\ biegów rozrządu świateł\ przeciw\ mgielnych
      lusterka świec paska\ klinowego alternatora akumulatora pompy\ wodnej
    ]

    "#{operation.sample} #{part.sample}"
  end
end
