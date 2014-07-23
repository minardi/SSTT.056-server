json.array!(@permissions) do |permission|
  json.extract! permission, :id, :allowed_for, :denied_for
end
