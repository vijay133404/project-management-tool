json.extract! project, :id, :name, :description, :project_type, :document, :technology, :client_name, :created_at, :updated_at
json.url project_url(project, format: :json)
