class CreateJoinTableJobsSpecialties < ActiveRecord::Migration[5.1]
  def change
    create_join_table :jobs, :specialties do |t|
      t.index [:job_id, :specialty_id]
      t.index [:specialty_id, :job_id]
    end
  end
end
