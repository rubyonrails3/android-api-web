json.array!(@locations) do |location|
  json.extract! location, :id, :url, :remote_id, :device_id, :remote_created_at
  json.url location_url(location, format: :json)
end
