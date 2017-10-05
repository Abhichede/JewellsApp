class AddColumnToStoreCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :stock_categories, :todays_rate, :string
  end
end
