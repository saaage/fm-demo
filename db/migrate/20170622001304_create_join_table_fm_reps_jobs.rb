class CreateJoinTableFmRepsJobs < ActiveRecord::Migration[5.1]
  def change
    create_join_table :fm_reps, :jobs do |t|
      t.index [:fm_rep_id, :job_id]
      t.index [:job_id, :fm_rep_id]
    end
  end
end
