class CreateMaterialsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.string :uuid, null: false, length: 36
      t.string :name, null: false
      t.timestamps
    end

    # add_index :materials, :uuid
    # add_index :materials, :name
  end
end
