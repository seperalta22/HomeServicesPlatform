class Booking
  belongs_to :user
  belongs_to :service

  validates :start_time, presence: true
  validates :end_time, presence: true
end
