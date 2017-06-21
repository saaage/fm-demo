class WorkSite < ApplicationRecord
  belongs_to :client
  belongs_to :state
  # has_and_belongs_to_many :jobs
end
