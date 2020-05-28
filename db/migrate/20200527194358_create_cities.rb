class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string  :name, null: false
      t.string  :state, null: false, index: true
      t.timestamps
    end
    add_index :cities, [:name, :state], unique: true
  end
end
