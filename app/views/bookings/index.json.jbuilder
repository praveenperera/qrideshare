json.array!(@bookings) do |booking|
  json.extract! booking, :id, :user_id, :ride_id, :passenger
  json.url booking_url(booking, format: :json)
end
