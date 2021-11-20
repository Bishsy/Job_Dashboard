class AddCinnumberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :cinumber, :string
  end
end
