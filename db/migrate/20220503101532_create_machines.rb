class CreateMachines < ActiveRecord::Migration[6.1]
  def change
    create_table :machines do |t|
      t.integer :genre_id,    null: false
      t.string  :name,        null: false
      t.text    :explanation, null: false
      t.timestamps
    end
  end
end
