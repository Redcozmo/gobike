# frozen_string_literal: true

class ServicesController < ApplicationController
  def index
    @networks = Citybike.new.networks
    # render json: @networks
  end
end
