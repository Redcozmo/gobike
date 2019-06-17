# frozen_string_literal: true

class Citybike < ApplicationRecord
  include HTTParty
  base_uri "api.citybik.es"

  def data
    self.class.get("/v2/networks")
  end

  def data_velib
    self.class.get("/v2/networks/velib")
  end

  def networks
    data.parsed_response
  end

  def stations
    data_velib.parsed_response
  end
end
