class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      enable_extension("citext")
      t.citext :name         
      t.integer :external_data_count , default: 0

      t.timestamps
    end         
  end
end
