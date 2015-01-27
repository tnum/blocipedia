class AddPremiumEndDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :premium_end_date, :date
  end
end
