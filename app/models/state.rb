class State < ApplicationRecord
  has_and_belongs_to_many :jobs
  has_and_belongs_to_many :providers
  has_many :clients
  has_many :work_sites
end
