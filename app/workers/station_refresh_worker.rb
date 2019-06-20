# frozen_string_literal: true

class StationRefreshWorker
  include Sidekiq::Worker

  def perform
    UpdateDb.new.update_db
  end
end
