class AddOrderToSteps < ActiveRecord::Migration[5.1]
  def change
    add_column :steps, :order, :integer
  end
end
