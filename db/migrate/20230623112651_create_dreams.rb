class CreateDreams < ActiveRecord::Migration[7.0]
  def change
    create_table :dreams do |t|
      t.text :story

      t.timestamps
    end
  end
end
