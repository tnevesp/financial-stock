class CreateCorretoras < ActiveRecord::Migration[5.0]
  def change
    create_table :corretoras do |t|
      t.string :nome

      t.timestamps
    end
  end
end
