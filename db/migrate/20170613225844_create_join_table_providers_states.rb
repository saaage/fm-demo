class CreateJoinTableProvidersStates < ActiveRecord::Migration[5.1]
  def up
    create_join_table :providers, :states do |t|
      # t.index [:provider_id, :state_id]
      # t.index [:state_id, :provider_id]
    end
  end
