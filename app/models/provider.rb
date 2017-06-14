class Provider < ApplicationRecord
  has_and_belongs_to_many :states
  has_and_belongs_to_many :specialties
end
