class CreateServiceNotUsings < ActiveRecord::Migration
  def change
    create_table :service_not_usings do |t|
      t.integer :core
      t.integer :san
      t.integer :nas
      t.integer :tape
      
      t.belongs_to :service

      t.timestamps null: false
    end
  end
end
