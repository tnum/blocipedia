class AddPremiumStartDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :premium_start_date, :date
  end
end
