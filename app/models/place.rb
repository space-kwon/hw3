class Place < ApplicationRecord
  has_many :entries, dependent: :destroy # If a place is deleted, its entries are also deleted
  validates :name, presence: true
end
