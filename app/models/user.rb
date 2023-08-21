# frozen_string_literal: true

class User
  has_secure_password

  has_many :services
  has_many :bookings
  has_many :reviews
end
