json.array!(@locations) do |location|
  json.extract! location, :id, :url, :remote_id, :device_id
  json.url location_url(location, format: :json)
end
