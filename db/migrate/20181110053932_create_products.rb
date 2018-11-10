class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :clicks, default: 0
      t.integer :views, default: 0

      t.timestamps null: false
    end
  end
end
