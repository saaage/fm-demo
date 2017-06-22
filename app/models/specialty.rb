class Specialty < ApplicationRecord
  has_and_belongs_to_many :providers
  has_and_belongs_to_many :jobs
end
