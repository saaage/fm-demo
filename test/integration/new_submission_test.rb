require 'test_helper'

class NewSubmissionTest < ActionDispatch::IntegrationTest

  def setup
    submission = Submission.create!( job: jobs(:job_0001),
                                   provider: providers(:dr_nick) )
  end

  test "We should be able to call Job.Providers" do
    assert jobs(:job_0001).providers = [providers(:dr_nick)]
  end

end
