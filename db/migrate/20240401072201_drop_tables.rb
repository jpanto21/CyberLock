class DropTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :organizations if ActiveRecord::Base.connection.table_exists? :organizations
    drop_table :users if ActiveRecord::Base.connection.table_exists? :users
  end
end
