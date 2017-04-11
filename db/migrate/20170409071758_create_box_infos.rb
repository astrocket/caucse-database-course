class CreateBoxInfos < ActiveRecord::Migration
  def change
    create_table :box_infos do |t|
      t.string :location
      t.string :index_start
      t.string :index_length
      t.string :ip
      t.string :name
      t.string :color
      
      t.belongs_to :box, index: true, foreign_key: true
      t.belongs_to :switch, index: true, foreign_key: true
      t.belongs_to :server, index: true, foreign_key: true
      t.belongs_to :service_using, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
