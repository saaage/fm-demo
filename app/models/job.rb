class Job < ApplicationRecord
  belongs_to :contact
  belongs_to :client
  belongs_to :acceptance
  belongs_to :decline
end
