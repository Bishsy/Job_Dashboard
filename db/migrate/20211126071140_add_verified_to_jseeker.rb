class AddVerifiedToJseeker < ActiveRecord::Migration[6.1]
  def change
    add_column :jseekers, :verified, :boolean, default: false, null:false
  end
end
