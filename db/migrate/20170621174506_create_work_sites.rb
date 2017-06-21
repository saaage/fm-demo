class CreateWorkSites < ActiveRecord::Migration[5.1]
  def change
    create_table :work_sites do |t|
      t.references :client, foreign_key: true
      t.string :address
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
