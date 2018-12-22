# frozen_string_literal: true

RSpec.describe 'Renewal', type: :model do
  before do
    VCR.insert_cassette 'renewal', record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  it 'records the fixture' do
  end
end
