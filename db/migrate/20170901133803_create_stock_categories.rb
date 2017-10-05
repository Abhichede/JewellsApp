class CreateStockCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_categories do |t|
      t.string :category_name
      t.string :quality

      t.timestamps
    end
  end
end
