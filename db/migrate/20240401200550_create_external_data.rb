class CreateExternalData < ActiveRecord::Migration[7.0]
  def change
    create_table :external_data do |t|
      enable_extension("citext")
      t.references :user, null: false, foreign_key: true
      t.citext :ext_username
      t.citext :ext_email, null: false, default: ""
      t.references :organization, null: false, foreign_key: true
      t.boolean :main_email   
      t.integer :alerts_count , default: 0

      t.timestamps
    end

    add_index :external_data, :ext_email
    add_index :external_data, :ext_username
  end
end
