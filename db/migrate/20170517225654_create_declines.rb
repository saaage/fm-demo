class CreateDeclines < ActiveRecord::Migration[5.1]
  def change
    create_table :declines do |t|

      t.timestamps
    end
  end
end
