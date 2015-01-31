class AddPrivateToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :is_private, :boolean, default: false
  end
end
