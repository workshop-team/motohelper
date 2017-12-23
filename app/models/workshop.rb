# frozen_string_literal: true

class Workshop < ApplicationRecord
  enum kind: {
    audi: 0, citroen: 1, fiat: 2, honda: 3, hyundai: 4, mazda: 5, opel: 6, peugeot: 7,
    renault: 8, toyota: 9, volkswagen: 10, warsztat_lakierniczy: 11, warsztat_samochodowy: 12
  }
end
