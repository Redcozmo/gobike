# frozen_string_literal: true

class BikesRefreshWorker
  include Sidekiq::Worker
  # sidekiq_options retry: 1 # Only one retries and then to the Dead Job Queue

  def perform
    UpdateDb.new.update_bikes
  end
end
