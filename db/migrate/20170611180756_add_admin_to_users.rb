class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean, default: false
    # Rails will automatically add a question mark admin? method due to the boolean data type of :admin
  end
end
