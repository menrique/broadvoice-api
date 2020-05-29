class CreateCompanyCities < ActiveRecord::Migration[6.0]
  def change
    create_table :company_cities do |t|
      t.references :company, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.timestamps
    end
    add_index :company_cities, [:company_id, :city_id], unique: true
  end
end
