class CreateGenera < ActiveRecord::Migration[7.0]
  def change
    create_table :genera do |t|
      t.string :name

      t.timestamps
    end
  end
end
