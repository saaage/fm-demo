class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :email
      t.string :specialty
      t.integer :experience

      t.timestamps
    end
  end
end
