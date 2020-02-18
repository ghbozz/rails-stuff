class Stuff < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  AVAILABILITIES = %w(monday tuesday wednesday thursday friday saturday sunday)
end
