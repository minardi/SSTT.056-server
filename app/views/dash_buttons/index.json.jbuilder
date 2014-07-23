json.array!(@dash_buttons) do |dash_button|
  json.extract! dash_button, :id, :btn_content, :btn_type, :permission
end
