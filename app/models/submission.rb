class Submission < ApplicationRecord
  belongs_to :job
  belongs_to :provider
end
