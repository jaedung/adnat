class Shift < ApplicationRecord

  belongs_to :user

  validates :start, presence: { message: "Start date is required." }
  validates :finish, presence: { message: "Finish date is required." }
  validates :break_length, presence: { message: "Break length is required." }

end
