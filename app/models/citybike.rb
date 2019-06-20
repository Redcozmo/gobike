# frozen_string_literal: true

class Citybike < ApplicationRecord
  include HTTParty
  base_uri "api.citybik.es"

  def data
    self.class.get("/v2/networks")
  end

  def networks
    data.parsed_response
  end
end
