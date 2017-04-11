class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :number
      t.string :location
      t.string :spec
      t.integer :core
      t.string :ip
      
      t.belongs_to :asset, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
