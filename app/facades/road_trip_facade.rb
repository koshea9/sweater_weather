class RoadTripFacade

  def self.get_road_trip_data(start_city, end_city)
    travel_time = DirectionsService.get_travel_time(start_city, end_city)


  end
end


#   {
#   "data": {
#     "id": null,
#     "type": "roadtrip",
#     "attributes": {
#       "start_city": "Denver, CO",
#       "end_city": "Estes Park, CO",
#       "travel_time": "2 hours, 13 minutes"
#       "weather_at_eta": {
#         "temperature": 59.4,
#         "conditions": "partly cloudy with a chance of meatballs"
#       }
#     }
#   }
# }
