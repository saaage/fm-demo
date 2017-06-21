class FmRep < ApplicationRecord
  belongs_to :user, -> { where role_id: 2}

  validates :cell_number, phone: { allow_blank: true }
  # add possible: true to check whether passed phone number is a possible number
  validates :work_number, phone: true

end
