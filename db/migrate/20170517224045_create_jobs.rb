class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.date :start
      t.date :end
      t.date :fillby
      t.datetime :created
      t.references :contact, foreign_key: true
      t.references :client, foreign_key: true
      t.string :status
      t.references :acceptance, foreign_key: true
      t.references :decline, foreign_key: true

      t.timestamps
    end
  end
end
