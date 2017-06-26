class Submission < ApplicationRecord

  enum app_status: { submitted: 0, in_review: 1, review_complete: 2 } do

    event :review do
      # before do
        # self.review_started_at = Time.zone.now
        # add a review_started_at column
        # self.save
      # end
      transition :submitted => :in_review
    end

    event :complete do


      transition [:submitted, :in_review] => :review_complete
    end

  end

  belongs_to :job
  belongs_to :provider

end
