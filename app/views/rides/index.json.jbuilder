json.array!(@rides) do |ride|
  json.extract! ride, :id, :driver, :source, :destination, :spots_available, :spots_taken, :passenger1, :passenger2, :passenger3, :passenger4, :passenger5, :passenger6, :passenger7
  json.url ride_url(ride, format: :json)
end
