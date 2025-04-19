class CreateStepRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :step_records do |t|
      t.date :date
      t.integer :steps
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
