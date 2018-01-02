class CreateMilestones < ActiveRecord::Migration[5.1]
  def change
    create_table :milestones do |t|
      t.string :name
      t.integer :task_id

      t.timestamps
    end
  end
end
