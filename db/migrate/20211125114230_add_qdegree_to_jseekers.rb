class AddQdegreeToJseekers < ActiveRecord::Migration[6.1]
  def change
    add_column :jseekers, :qdegree, :string
  end
end
