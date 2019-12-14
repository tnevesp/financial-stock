class AddColumnObservacaoToCarteiras < ActiveRecord::Migration[5.0]
  def change
    add_column :carteiras, :observacao, :text
  end
end
