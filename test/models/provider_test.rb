require 'test_helper'

class ProviderTest < ActiveSupport::TestCase

  def setup
    @provider_with_role_provider = providers(:dr_nick)
    @provider_without_role_provider = providers(:dr_quack)
    @redundant_provider = Provider.new( experience: 0,
                                        user: users(:iamadoctor) )
  end

  test "Provider can be associated with a User containing role type provider" do
    assert @provider_with_role_provider.valid?
  end

  test "Provider can not associated with a User not containing a role type of provider" do
    assert_not @provider_without_role_provider.valid?
  end

  test "Provider will not be saved if User already associated with another Contact" do
    assert_not @redundant_provider.save
  end

end
