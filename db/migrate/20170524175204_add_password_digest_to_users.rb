class AddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string
  end
  # add_column accepts :password_digest, :string  - then adds this new column to our users table. has_secure_password looks for a password_digest column to perform it's function
end
