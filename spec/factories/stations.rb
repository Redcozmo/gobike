# frozen_string_literal: true

FactoryBot.define do
  factory :station do
    empty_slots { Faker::Number.number(2) }
    slots { Faker::Number.number(2) }
    status { Faker::Boolean.boolean }
    free_bikes { Faker::Number.number(2) }
    station_id { Faker::Number.number(20) }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    name { Faker::Address.street_address }
    update_date { Time.zone.now }
  end
end
