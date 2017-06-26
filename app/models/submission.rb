class Submission < ApplicationRecord

  enum app_status: { submitted: 0, in_review: 1, review_complete: 2 }

  belongs_to :job
  belongs_to :provider

end
