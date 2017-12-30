class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :project_type
      t.string :document
      t.string :technology
      t.string :client_name

      t.timestamps
    end
  end
end
