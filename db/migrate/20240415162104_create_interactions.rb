class CreateInteractions < ActiveRecord::Migration[7.0]
  def change
    create_table :interactions do |t|
      t.references :user, null: false, foreign_key: true
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
