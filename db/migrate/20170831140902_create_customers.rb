class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :contact
      t.string :total_amount, default: 0
      t.string :paid_amount, default: 0

      t.timestamps
    end
  end
end
