require 'test_helper'

class JobTest < ActiveSupport::TestCase

  def setup
    @job = jobs(:job_0001)
    @invalid_job = Job.new( client_id: '' )
  end

  test "Jobs can be created" do
    assert @job.valid?
  end

  test "Jobs can not be created without a valid client association" do
    assert_not @invalid_job.valid?
  end

end
