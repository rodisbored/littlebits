class CreateInventionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :inventions do |t|
      t.string :uuid, null: false, length: 36
      t.string :title, null: false
      t.text :description, null: false
      t.string :username
      t.string :email
      t.text :bits, null: false
      t.text :materials
      t.integer :creator_id, null: false
      t.timestamps
    end

    add_index :inventions, :uuid
    add_index :inventions, :creator_id
  end
end
