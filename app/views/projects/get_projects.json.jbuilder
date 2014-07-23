json.array!(@proj) do |project|
  json.extract! project, :id, :title, :description, :owner, :start, :finish, :role, :pm
  json.url project_url(project, format: :json)
end
