class Client < ApplicationRecord
  belongs_to :state
  has_many :contacts
  has_many :work_sites
end
