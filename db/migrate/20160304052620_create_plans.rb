class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :plan_name
      t.integer :amount
      t.string  :currency
      t.timestamps null: false
    end
  end
end
