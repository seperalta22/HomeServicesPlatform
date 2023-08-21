# frozen_string_literal: true

class Service
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_and_belongs_to_many :service_categories
end
