class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :sku
      t.string :name
      t.integer :category_id
      t.string :purchase_rate
      t.string :quantity
      t.string :sgst_rate
      t.string :cgst_rate

      t.timestamps
    end
  end
end
