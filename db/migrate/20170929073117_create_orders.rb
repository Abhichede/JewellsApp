class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :subtotal
      t.string :tax_rate, default: '0'
      t.string :total_tax, default: '0'
      t.string :total_amount
      t.string :extra_fee, default: '0'
      t.string :date
      t.text :extra_notes
      t.boolean :deleting_status, default: false

      t.timestamps
    end
  end
end
