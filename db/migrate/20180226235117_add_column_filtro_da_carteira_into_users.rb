class AddColumnFiltroDaCarteiraIntoUsers < ActiveRecord::Migration[5.0]
  def change
  	enable_extension 'citext'

  	add_column :users, :filtro_da_carteira, :jsonb, null: false, default: '{}'
  	add_index  :users, :filtro_da_carteira, using: :gin
  end
end
