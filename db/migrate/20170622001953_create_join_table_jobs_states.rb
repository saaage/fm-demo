class CreateJoinTableJobsStates < ActiveRecord::Migration[5.1]
  def change
    create_join_table :jobs, :states do |t|
      t.index [:job_id, :state_id]
      t.index [:state_id, :job_id]
    end
  end
end
