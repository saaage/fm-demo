class CreateFmReps < ActiveRecord::Migration[5.1]
  def change
    create_table :fm_reps do |t|
      t.references :user, foreign_key: true
      t.string :nickname
      t.string :cell_number
      t.string :work_number
      t.date :birthday

      t.timestamps
    end
  end
end
