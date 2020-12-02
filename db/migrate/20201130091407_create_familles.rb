class CreateFamilles < ActiveRecord::Migration[6.0]
  def change
    create_table :familles do |t|
      t.string :nom

      t.timestamps
    end
  end
end
