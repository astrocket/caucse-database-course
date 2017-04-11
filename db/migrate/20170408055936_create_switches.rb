class CreateSwitches < ActiveRecord::Migration
  def change
    create_table :switches do |t|
      t.string :number
      t.string :location
      t.string :spec
      t.string :ip
      t.belongs_to :asset, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
