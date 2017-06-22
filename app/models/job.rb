class Job < ApplicationRecord
  belongs_to :client

  has_many :submissions
  has_many :providers, through: :submissions

  has_and_belongs_to_many :fm_reps
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :specialties
  has_and_belongs_to_many :states
end
