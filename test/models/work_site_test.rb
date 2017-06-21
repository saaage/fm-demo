require 'test_helper'

class WorkSiteTest < ActiveSupport::TestCase

  def setup
    @worksite = work_sites(:dr_bob_ent)
  end

  test "Work Sites can be created" do
    assert  @worksite.valid?
  end

  test "Address can not be blank" do
    @worksite_blank_address = WorkSite.new( client_id: 1,
                              address: "",
                              state_id: 1)
    assert_not @worksite_blank_address.save
  end

end
