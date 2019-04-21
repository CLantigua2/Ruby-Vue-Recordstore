class Artist < ApplicationRecord
  has_many :records, dependent: :destroy

  # validate that the name exists
  validates :name, presence: true
end
