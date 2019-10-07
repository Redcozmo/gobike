# frozen_string_literal: true

class ClosestStations
  #
  # Description :
  # => Use the ClosestStations class to calculate the closest stations
  #   to a position with two lon/lat coordinate pairs.
  #
  # Output :
  # => array with <num> closest stations from input coordinate point
  #
  # Example usage :
  # => ClosestStations.new(coord, num).closest_stations

  attr_accessor :longitude, :latitude, :num

  def initialize(coord, num)
    @latitude, @longitude = coord
    @num = num
  end

  def closest_stations
    @stations = Station.all
    distances = {}
    selection = {}
    @stations.map do |station|
      distances[station.station_id] =
        Haversine.new(
          [station.latitude, station.longitude],
          [@latitude, @longitude]
        ).distance
    end
    distances.values.min(@num).each { |distance| selection[distances.key(distance)] = distance }
    [@stations.select { |station| selection.keys.find { |id| id == station.station_id } }, distances]
  end
end
