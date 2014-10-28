json.array!(@requests) do |request|
  json.extract! request, :id, :user_id, :ride_id, :passenger, :ignore
  json.url request_url(request, format: :json)
end
