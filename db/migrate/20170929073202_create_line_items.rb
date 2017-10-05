class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :category_id
      t.string :weight
      t.string :rate
      t.string :subtotal
      t.string :tax_rate, default: '0'
      t.string :total_tax, default: '0'
      t.string :total_amount
      t.boolean :deleting_status, default: false

      t.timestamps
    end
  end
end
