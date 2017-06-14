class RemoveSpecialtyFromProviders < ActiveRecord::Migration[5.1]
  def change
    remove_column :providers, :specialty, :string
  end
end
