class CreateAppliedFors < ActiveRecord::Migration[6.1]
  def change
    create_table :applied_fors do |t|
      t.integer :status
      t.references :job, null: false, foreign_key: true
      t.references :jseeker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
