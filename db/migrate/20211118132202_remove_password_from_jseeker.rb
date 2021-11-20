class RemovePasswordFromJseeker < ActiveRecord::Migration[6.1]
  def change
    remove_column :jseekers, :password, :string
  end
end
