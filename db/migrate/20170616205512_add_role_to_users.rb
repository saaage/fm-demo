class AddRoleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :role, foreign_key: true, default: 2
  end
end