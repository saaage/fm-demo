class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.references :job, foreign_key: true
      t.references :provider, foreign_key: true
      t.string :app_status, index: true
      t.boolean :accepted, default: false

      t.index [:job_id, :provider_id]
      t.index [:provider_id, :job_id]
      # revisit the need for these columns when queries have been identified

      t.timestamps
    end
  end
end
