class Contact < ApplicationRecord
  belongs_to :client
  belongs_to :user, -> { where role_id: 4 }
end
