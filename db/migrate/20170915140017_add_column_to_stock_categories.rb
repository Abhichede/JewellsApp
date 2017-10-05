class AddColumnToStockCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :stock_categories, :weight_in_stock, :string, :default => '0'
    add_column :stock_categories, :amount_spent, :string, :default => '0'
    add_column :stock_categories, :deleting_status, :boolean, :default => false

  end
end
