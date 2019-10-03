# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Station, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:station) { FactoryBot.build(:station) }

  describe 'Model instantiation' do
    subject(:new_station) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:empty_slots).of_type(:integer) }
      it { is_expected.to have_db_column(:slots).of_type(:integer) }
      it { is_expected.to have_db_column(:status).of_type(:string) }
      it { is_expected.to have_db_column(:free_bikes).of_type(:integer) }
      it { is_expected.to have_db_column(:station_id).of_type(:string) }
      it { is_expected.to have_db_column(:latitude).of_type(:float) }
      it { is_expected.to have_db_column(:longitude).of_type(:float) }
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:update_date).of_type(:datetime) }
    end
  end
end
