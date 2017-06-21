class Contact < ApplicationRecord
  belongs_to :client
  belongs_to :user, -> { where role_id: 4 }

  validates :user_id, uniqueness: true
  validates :job_title, presence: true

end
