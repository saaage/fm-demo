class CreateFmReps < ActiveRecord::Migration[5.1]
  def change
    create_table :fm_reps do |t|

      t.timestamps
    end
  end
end
