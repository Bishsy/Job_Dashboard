class CreateJseekers < ActiveRecord::Migration[6.1]
  def change
    create_table :jseekers do |t|
      t.string :name
      t.string :mobile
      t.string :email
      t.integer :percentage
      t.string :password
      t.string :confirm_password

      t.timestamps
    end
  end
end
