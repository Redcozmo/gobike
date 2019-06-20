# frozen_string_literal: true

class VelibStationsController < ApplicationController
  def index
    @stations = Station.new.stations
  end
end
