class RemoveConfirmPasswordFromJseeker < ActiveRecord::Migration[6.1]
  def change
    remove_column :jseekers, :confirm_password, :string
  end
end
