class CreateTrees < ActiveRecord::Migration[7.0]
  def change
    create_table :trees do |t|
      t.integer :gla_id, index: { unique: true }
      t.references :borough, null: false, foreign_key: true
      t.references :species, null: false, foreign_key: true
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
