class AddOrderToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :order, :string
    add_column :line_items, :references, :string
  end
end
