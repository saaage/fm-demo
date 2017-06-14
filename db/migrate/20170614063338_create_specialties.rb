class CreateSpecialties < ActiveRecord::Migration[5.1]
  def change
    create_table :specialties do |t|
      t.string :provider_type
      t.string :specialty
      t.string :sub_specialty

      t.timestamps
    end
  end
end
