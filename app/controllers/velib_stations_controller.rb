# frozen_string_literal: true

class VelibStationsController < ApplicationController
  def index
    @stations = Citybike.new.stations
  end
end
