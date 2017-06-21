class Submission < ApplicationRecord
  # submission contains refernce to a job and a provider
  # each submission have a column for application status(string) and acceptance status(boolean)
  belongs_to :job
  belongs_to :provider


end
