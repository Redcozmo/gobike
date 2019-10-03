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
  # => UpdateDb.new.update_bikes
  # => UpdateDb.new.update_stations
  # => UpdateDb.new.delete_old_stations

  def initialize
    puts "Request on API : api.citybik.es/v2/networks/velib"
    @stations_from_api = Station.new.stations
  end

  def update_bikes
    puts " --> DB update with bikes information"
    @stations_from_api["network"]["stations"].each do |api_station|
      station_by_id = Station.find_by(station_id: api_station["id"])
      next if station_by_id.nil?

      next unless api_station["timestamp"] > station_by_id.update_date

      station_by_id.update(
        free_bikes: api_station["free_bikes"],
        empty_slots: api_station["empty_slots"],
        update_date: api_station["timestamp"]
      )
    end
  end

  def update_stations
    puts " --> DB update with stations information"
    @stations_from_api["network"]["stations"].each do |api_station|
      station_by_id = Station.find_by(station_id: api_station["id"])
      station_by_name = Station.find_by(name: api_station["name"])
      # updating existing station by its unique id
      if !station_by_id.nil?
        next unless api_station["timestamp"] > station_by_id.update_date

        update_station(station_by_id, api_station)
      # Manage API updating station with a new "unique id" but same name !
      elsif !station_by_name.nil?
        next unless api_station["timestamp"] > station_by_name.update_date

        update_station(station_by_name, api_station)
      # create station because it is a new station (checking ids and names)
      else
        create_station(api_station)
      end
    end
  end

  def delete_old_stations
    puts " --> DB update with stations information - delete old stations"
    station_to_delete = Station.all.reject do |db_station|
      @stations_from_api["network"]["stations"].find { |api_station| api_station["id"] == db_station.station_id }
    end
    if station_to_delete && station_to_delete.count != 0
      puts "Il y a #{station_to_delete.count} stations en DB qui n'existent plus sur l'API : elles vont être supprimées."
      station_to_delete.each { |station| puts station.name }
      station_to_delete.each(&:delete)
    else
      puts "Il y a #{station_to_delete.count} station en DB qui n'existent plus sur l'API."
    end
  end

  def create_station(api_station)
    Station.create(
      station_id: api_station["id"], name: api_station["name"],
      latitude: api_station["latitude"], longitude: api_station["longitude"],
      status: api_station["extra"]["status"], slots: api_station["extra"]["slots"],
      free_bikes: api_station["free_bikes"],
      empty_slots: api_station["empty_slots"],
      update_date: api_station["timestamp"]
    )
  end

  def update_station(db_station, api_station)
    db_station.update(
      name: api_station["name"], latitude: api_station["latitude"],
      longitude: api_station["longitude"], status: api_station["extra"]["status"],
      slots: api_station["extra"]["slots"],
      free_bikes: api_station["free_bikes"],
      empty_slots: api_station["empty_slots"],
      update_date: api_station["timestamp"]
    )
  end
end
