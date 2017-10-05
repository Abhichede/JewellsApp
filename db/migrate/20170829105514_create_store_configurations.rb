class CreateStoreConfigurations < ActiveRecord::Migration[5.0]
  def change
    create_table :store_configurations do |t|
      t.string :store_name
      t.text :store_desc
      t.string :email
      t.string :phone
      t.string :website
      t.string :address
      t.string :gstn

      t.timestamps
    end
  end
end
