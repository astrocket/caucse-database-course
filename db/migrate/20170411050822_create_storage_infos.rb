class CreateStorageInfos < ActiveRecord::Migration
  def change
    create_table :storage_infos do |t|
      t.string :name
      t.date :registration_date
      t.string :disk_capacity
      t.string :storage_type
      t.float :allocation_unit
      t.float :allocation_volume
      t.float :allocation_left
      
      t.belongs_to :storage, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
