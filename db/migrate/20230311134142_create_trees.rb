class CreateTrees < ActiveRecord::Migration[7.0]
  def change
    create_table :trees do |t|
      t.references :species, null: false, foreign_key: true
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
