require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase

  def setup
    @submission = submissions(:submission_0001)
  end

  test "We can create a new submission" do
    assert @submission.valid?
  end

  test "Default value for application status should be 'Submitted' " do
    test_sub = Submission.create!( job: jobs(:job_0001),
                                   provider: providers(:dr_nick) )
    assert test_sub.app_status == 'Submitted'
  end

  test "Default acceptance status should be false" do
    test_sub = Submission.create!( job: jobs(:job_0001),
                                   provider: providers(:dr_nick) )
    assert_not test_sub.accepted?
  end

  test "We should be able to call job.providers " do
    test_sub = Submission.create!( job: jobs(:job_0001),
                                   provider: providers(:dr_nick) )
  end

end
