class CreateSpecies < ActiveRecord::Migration[7.0]
  def change
    create_table :species do |t|
      t.string :name
      t.string :common_name
      t.references :genus, null: false, foreign_key: true

      t.timestamps
    end
  end
end
