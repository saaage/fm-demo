class Job < ApplicationRecord
  belongs_to :client
  has_many :submissions
  has_many :providers, through: :submissions
end
