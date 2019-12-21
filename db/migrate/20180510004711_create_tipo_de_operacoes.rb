class CreateTipoDeOperacoes < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_de_operacoes do |t|
    	t.string :nome
      t.timestamps
    end
  end
end
