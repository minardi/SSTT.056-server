json.array!(@stories) do |story|
  json.extract! story, :id, :title, :description, :estimation, :parent_id, :status, :item_type
  json.end story.info["end_date"]
  json.url backlog_items_url(story, format: :json)
end
