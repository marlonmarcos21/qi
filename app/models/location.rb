class Location < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
