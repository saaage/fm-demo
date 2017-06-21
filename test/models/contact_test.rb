require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  def setup
    @contact_via_client_contact = contacts(:malory)
    @contact_via_non_client_contact = contacts(:archer)
    @redundant_contact = Contact.new( client_id: clients(:one),
                            user_id: users(:malory).id )
  end

  test "Contact can be created using role type client_admin" do
    assert @contact_via_client_contact.valid?
  end

  test "Contact can not be created using a non client_admin role types" do
    assert_not @contact_via_non_client_contact.valid?
  end

  test "Contact will not be saved if User already associated with another Contact" do
    assert_not @redundant_contact.save
  end

end
