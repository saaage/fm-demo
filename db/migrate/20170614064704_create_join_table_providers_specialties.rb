class CreateJoinTableProvidersSpecialties < ActiveRecord::Migration[5.1]
  def change
    create_join_table :providers, :specialties do |t|
      t.index [:provider_id, :specialty_id]
      t.index [:specialty_id, :provider_id]
    end
  end
end
