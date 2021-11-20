class AddMobilenoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :mobileno, :string
  end
end
