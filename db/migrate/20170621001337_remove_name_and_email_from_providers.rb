# removing namd and email from Providers table
# adding a reference to User

class RemoveNameAndEmailFromProviders < ActiveRecord::Migration[5.1]
  def change
    remove_column :providers, :name, :string
    remove_column :providers, :email, :string
    add_reference :providers, :user, foreign_key: true
  end
end
