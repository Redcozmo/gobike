# frozen_string_literal: true

class StationsRefreshWorker
  include Sidekiq::Worker
  # sidekiq_options retry: 7 # Only seven retries and then to the Dead Job Queue

  def perform
    UpdateDb.new.update_stations
  end
end
