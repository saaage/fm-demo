class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :specialty
      t.numeric :experience
      t.string :email

      t.timestamps
    end
  end
end
