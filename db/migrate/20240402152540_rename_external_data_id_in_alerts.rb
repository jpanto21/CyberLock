class RenameExternalDataIdInAlerts < ActiveRecord::Migration[7.0]
  def change
    rename_column :alerts, :external_data_id, :external_datum_id
  end
end
