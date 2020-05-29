class PersonCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :person_companies do |t|
      t.references :person, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.timestamps
    end
    add_index :person_companies, [:person_id, :company_id], unique: true
  end
end
