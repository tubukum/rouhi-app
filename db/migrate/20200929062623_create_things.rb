class CreateThings < ActiveRecord::Migration[5.2]
  def change
    create_table :things do |t|
      t.string :name
      t.integer :lowprice
      t.integer :highprice
      t.date :date
      t.boolean :shop

      t.timestamps
    end
  end
end
