# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @networks = Citybike.new.networks
    # render json: @networks
    @stations = Citybike.new.stations
  end
end
