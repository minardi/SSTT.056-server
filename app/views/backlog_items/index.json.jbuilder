json.array!(@backlog_items) do |backlog_item|
  json.extract! backlog_item, :id, :title, :description, :estimation, :parent_id, :status, :item_type
  json.url backlog_item_url(backlog_item, format: :json)
end
