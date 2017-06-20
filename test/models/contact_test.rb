require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  def setup
    @contact_via_client_contact = contacts(:malory)
    @contact_via_non_client_contact = contacts(:archer)
  end

  test "Contact can be created using role type client_admin" do
    assert @contact_via_client_contact.valid?
  end

  test "Contact can not be created with using a non client_admin role types" do
    assert_not @contact_via_non_client_contact.valid?
  end

end
