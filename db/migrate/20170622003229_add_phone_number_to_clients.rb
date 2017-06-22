class AddPhoneNumberToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :main_phone, :string
  end
end
