class AddColumnTipoDeOperacaoIdToCarteiras < ActiveRecord::Migration[5.0]
  def change
    add_reference :carteiras, :tipo_de_operacao, foreign_key: true
  end
end
