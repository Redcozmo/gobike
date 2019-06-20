# frozen_string_literal: true

class UpdateDb
  #
  # Description :
  # => Use the UpdateDb to populate (first time) or update DB with datas
  # from API
  #
  # Output :
  # => Update of DB
  #
  # Example usage :
  # => UpdateDb.new.update_db

  def initialize
    puts "Request on API : api.citybik.es/v2/networks/velib"
    @stations = Station.new.stations
  end

  def update_db
    @stations["network"]["stations"].each do |station|
      station_to_compare = Station.find_by(station_id: station["id"])
      if !station_to_compare.nil?
        if station["timestamp"] > station_to_compare.update_date
          station_to_compare.update(
            name: station["name"], latitude: station["latitude"],
            longitude: station["longitude"], status: station["extra"]["status"],
            slots: station["extra"]["slots"],
            free_bikes: station["free_bikes"],
            empty_slots: station["empty_slots"],
            update_date: station["timestamp"]
          )
        end
      else
        Station.create(
          station_id: station["id"], name: station["name"],
          latitude: station["latitude"], longitude: station["longitude"],
          status: station["extra"]["status"], slots: station["extra"]["slots"],
          free_bikes: station["free_bikes"],
          empty_slots: station["empty_slots"],
          update_date: station["timestamp"]
        )
      end
    end
  end
end
