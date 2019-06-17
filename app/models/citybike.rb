# frozen_string_literal: true

class Citybike < ApplicationRecord
  include HTTParty
  base_uri 'http://api.citybik.es/v2/'
end
