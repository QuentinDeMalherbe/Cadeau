class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.boolean :participant , default: true
      t.boolean :selectionne , default: false
      t.boolean :a_selectionne , default: false
      t.integer :give_to_user
      t.integer :recieve_from_user
      t.references :famille, null: false, foreign_key: true
      t.timestamps
    end
  end
end
