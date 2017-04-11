class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.string :number
      t.string :location
      t.string :spec
      
      t.belongs_to :asset, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
