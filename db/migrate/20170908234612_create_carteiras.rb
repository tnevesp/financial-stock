class CreateCarteiras < ActiveRecord::Migration[5.0]
  def change
    create_table :carteiras do |t|
      t.date :data_da_compra
      t.references :empresa, foreign_key: true
      t.references :user, foreign_key: true
      t.decimal :entrada, precision: 11, scale: 2
      t.decimal :alvo, precision: 11, scale: 2
      t.decimal :stop, precision: 11, scale: 2
      t.decimal :atual, precision: 5, scale: 2
      t.integer :quantidade
      t.string :situacao
      t.decimal :total_da_compra, precision: 11, scale: 2
      t.decimal :total_da_venda, precision: 11, scale: 2

      t.timestamps
    end
  end
end
