# frozen_string_literal: true

class SeedDb
  #
  # Description :
  # => Use the SeedDb to populate de DB with datas from API
  #
  # Output :
  # => Population of the DB with Station instances
  #
  # Example usage :
  # => SeedDb.new.populate

  def initialize
    @stations = Citybike.new.stations
  end

  def populate
    @stations["network"]["stations"].each do |station|
      Station.create(
        station_id: station["id"],
        name: station["name"],
        latitude: station["latitude"],
        longitude: station["longitude"],
        status: station["extra"]["status"],
        slots: station["extra"]["slots"],
        free_bikes: station["free_bikes"],
        empty_slots: station["empty_slots"],
        timestamp: station["timestamp"]
      )
    end
  end
end
