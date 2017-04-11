class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :number
      t.date :purchased_date
      t.string :name
      t.string :standard
      t.string :price
      t.string :seller
      t.string :year

      t.timestamps null: false
    end
  end
end
