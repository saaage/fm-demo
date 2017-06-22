class Client < ApplicationRecord
  belongs_to :state

  has_many :contacts
  has_many :work_sites
  has_many :jobs

  validates :main_phone, presence: true, phone: true
end
