class ChangeStocksFromsgstRateToweight < ActiveRecord::Migration[5.0]
  def change
    rename_column :stocks, :sgst_rate, :weight
    rename_column :stocks, :cgst_rate, :gst_rate
  end
end
