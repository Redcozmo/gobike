# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @stations = Station.all
    @closest_stations, @distances = ClosestStations.new([2.3466598, 48.8721312], 5).closest_stations
  end
end
