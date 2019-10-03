# frozen_string_literal: true

class Haversine
  #
  # Description :
  # => use the Haversine class to calculate the distance between
  #    two lon/lat coordinate pairs.
  #
  # Output :
  # => distance available in meters.
  #
  # Example usage :
  # => Haversine.new([lon1,lat1],[lon2,lat2]).distance

  attr_accessor :distance

  def initialize(coord1, coord2)
    lon1, lat1 = coord1
    lon2, lat2 = coord2
    deg_to_rad = Math::PI / 180

    earth_radius = 6_371_000 # radius of Earth in meters
    phi1 = lat1 * deg_to_rad
    phi2 = lat2 * deg_to_rad

    delta_phi = (lat2 - lat1) * deg_to_rad
    delta_lambda = (lon2 - lon1) * deg_to_rad

    a = Math.sin(delta_phi / 2.0)**2 +
        Math.cos(phi1) * Math.cos(phi2) *
        Math.sin(delta_lambda / 2.0)**2
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

    @distance = c * earth_radius
  end
end
