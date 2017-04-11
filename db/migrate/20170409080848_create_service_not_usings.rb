class CreateServiceNotUsings < ActiveRecord::Migration
  def change
    create_table :service_not_usings do |t|
      t.string :name
      t.integer :core
      t.integer :san
      t.integer :nas
      t.integer :tape
      

      t.timestamps null: false
    end
  end
end
