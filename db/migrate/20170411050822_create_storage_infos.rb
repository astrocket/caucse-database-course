class CreateStorageInfos < ActiveRecord::Migration
  def change
    create_table :storage_infos do |t|
      t.string :name
      t.date :registration_date
      t.string :disk_capacity
      t.string :type
      t.integer :allocation_unit
      t.integer :allocation_volume
      t.integer :allocation_left
      
      t.belongs_to :storage, index: true, foreign_key: true
      t.belongs_to :storage_allocation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
