class RemoveNameAndPhoneNumberAndEmailFromContact < ActiveRecord::Migration[5.1]
  def change
    remove_column :contacts, :name, :string
    remove_column :contacts, :email, :string
    remove_column :contacts, :phone_number, :string
    add_column :contacts, :job_title, :string
    add_reference :contacts, :user, foreign_key: true
  end
end
