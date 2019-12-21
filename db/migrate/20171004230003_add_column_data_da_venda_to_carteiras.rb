class AddColumnDataDaVendaToCarteiras < ActiveRecord::Migration[5.0]
  def change
    add_column :carteiras, :data_da_venda, :date
  end
end
