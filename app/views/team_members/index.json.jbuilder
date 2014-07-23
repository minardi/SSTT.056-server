json.array!(@team_members) do |team_member|
  json.extract! team_member, :id, :user_id, :team_id, :role
  json.url team_member_url(team_member, format: :json)
end
