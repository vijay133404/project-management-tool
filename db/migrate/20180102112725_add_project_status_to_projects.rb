class AddProjectStatusToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :project_status, :string
  end
end
