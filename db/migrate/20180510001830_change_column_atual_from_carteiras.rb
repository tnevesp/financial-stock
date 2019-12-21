class ChangeColumnAtualFromCarteiras < ActiveRecord::Migration[5.0]
  def change
  	change_column :carteiras, :entrada, :decimal, precision: 11, scale: 5
  	change_column :carteiras, :atual, :decimal, precision: 11, scale: 5
  	change_column :carteiras, :total_da_compra, :decimal, precision: 11, scale: 5
  	change_column :carteiras, :total_da_venda, :decimal, precision: 11, scale: 5
  end
end
