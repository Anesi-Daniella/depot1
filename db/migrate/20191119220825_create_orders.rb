class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :text
      t.string :email
      t.string :string
      t.string :pay_type
      t.string :integer

      t.timestamps
    end
  end
end
