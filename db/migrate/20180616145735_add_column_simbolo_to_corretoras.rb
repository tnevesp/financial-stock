class AddColumnSimboloToCorretoras < ActiveRecord::Migration[5.0]
  def change
    add_column :corretoras, :simbolo, :string
  end
end
