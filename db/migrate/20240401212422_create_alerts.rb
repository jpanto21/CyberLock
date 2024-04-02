class CreateAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :alerts do |t|
      
      t.references :external_data, null: false, foreign_key: true
      t.timestamps
    end
  end
end
