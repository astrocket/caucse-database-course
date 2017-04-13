class CreateStorageAllocations < ActiveRecord::Migration
  def change
    create_table :storage_allocations do |t|
      t.float :allocation
      t.string :purpose
      
      t.belongs_to :service, index: true, foreign_key: true
      t.belongs_to :storage_info, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
