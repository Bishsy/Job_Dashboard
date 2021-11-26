class AddJdesToJseekers < ActiveRecord::Migration[6.1]
  def change
    add_column :jseekers, :jdes, :text
  end
end
