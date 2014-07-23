json.array!(@backlog_items) do |backlog_item|
  json.extract! backlog_item, :id, :title, :description, :estimation, :parent_id, :status, :item_type

  if backlog_item.item_type == "sprint"
    json.start backlog_item.info["start_date"]
    json.end backlog_item.info["end_date"]
  end
  
  json.url backlog_item_url(backlog_item, format: :json)
end
