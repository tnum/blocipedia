class AddStripeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripeid, :string
    add_column :users, :subid, :string
  end
end
