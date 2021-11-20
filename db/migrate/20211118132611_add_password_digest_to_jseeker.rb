class AddPasswordDigestToJseeker < ActiveRecord::Migration[6.1]
  def change
    add_column :jseekers, :password_digest, :string
  end
end
