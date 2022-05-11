class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :brand_name
      t.string :corporate_name
      t.string :registration_number
      t.string :email
      t.string :phone
      t.string :full_address

      t.timestamps
    end
  end
end
