class AddColumnCorretoraIdToCarteiras < ActiveRecord::Migration[5.0]
  def change
    add_reference :carteiras, :corretora, foreign_key: true
  end
end
