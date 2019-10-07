# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @stations = Station.all
    @closest_stations, @distances = ClosestStations.new([48.8721312, 2.3466598], 5).closest_stations
  end
end
