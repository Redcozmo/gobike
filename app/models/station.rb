# frozen_string_literal: true

class Station < ApplicationRecord
  include HTTParty
  base_uri "api.citybik.es"

  def data_velib
    self.class.get("/v2/networks/velib")
  end

  def stations
    data_velib.parsed_response
  end
end
