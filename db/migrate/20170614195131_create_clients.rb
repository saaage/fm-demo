class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.references :state, foreign_key: true
      t.string :website

      t.timestamps
    end
  end
end
