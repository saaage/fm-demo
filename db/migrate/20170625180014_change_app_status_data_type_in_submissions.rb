class ChangeAppStatusDataTypeInSubmissions < ActiveRecord::Migration[5.1]
  def change
    remove_column :submissions, :app_status
    add_column :submissions, :app_status, :integer, default: 0
  end
end
