class CreatePersonCities < ActiveRecord::Migration[6.0]
  def change
    create_table :person_cities do |t|
      t.references :person, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.timestamps
    end
    add_index :person_cities, [:person_id, :city_id], unique: true
  end
end
