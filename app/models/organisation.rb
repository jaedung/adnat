class Organisation < ApplicationRecord

  has_many :users
  has_many :shifts

  validates :name, presence: { message: "Name is required." }
  validates :hourly_rate, presence: { message: "Hourly rate is required." }

end
