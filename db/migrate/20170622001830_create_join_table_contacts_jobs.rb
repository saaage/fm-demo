class CreateJoinTableContactsJobs < ActiveRecord::Migration[5.1]
  def change
    create_join_table :contacts, :jobs do |t|
      t.index [:contact_id, :job_id]
      t.index [:job_id, :contact_id]
    end
  end
end
