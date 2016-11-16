class CreateWallets < ActiveRecord::Migration[5.0]
  def change
    create_table :wallets do |t|
      t.references :paper, foreign_key: true
      t.references :user, foreign_key: true
      t.decimal :purchased_price, :precision => 8, :scale => 2
      t.integer :quantity
      t.date :purchased_at

      t.timestamps
    end
  end
end
