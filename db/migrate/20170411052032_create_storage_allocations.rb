class CreateStorageAllocations < ActiveRecord::Migration
  def change
    create_table :storage_allocations do |t|
      t.integer :allocation
      t.string :purpose
      
      t.belongs_to :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
