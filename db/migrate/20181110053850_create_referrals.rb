class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.string :code
      t.integer :product_id, index: true
      t.integer :user_id, index: true
      t.string :url

      t.timestamps null: false
    end
  end
end
