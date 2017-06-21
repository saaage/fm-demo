class WorkSite < ApplicationRecord
  belongs_to :client
  belongs_to :state
  # has_and_belongs_to_many :jobs
  validates :address, presence: { message: "Please enter an address" }, length: { maximum: 50, message: "Address is too long" }, uniqueness: { message: "Work site already exists" }

end
