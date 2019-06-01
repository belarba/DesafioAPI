class Desafio < ApplicationRecord
  validates :event, presence: true
  validates :timestamp, presence: true
end
