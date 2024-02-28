class CreateShipments < ActiveRecord::Migration[7.1]
  def change
    create_table :shipments do |t|
      t.string :item
      t.string :source
      t.string :destination
      t.string :status
      t.integer :customer_id
      t.integer :delivery_partner_id

      t.timestamps
    end
  end
end
