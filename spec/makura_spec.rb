# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Makura do
  it 'has a version number' do
    expect(Makura::VERSION).not_to be nil
  end

  describe '#configure' do
    before do
      Makura.configure do |config|
        config.api_version = 2
      end
    end

    it 'returns api version 2' do
      expect(Makura.configuration.api_version).to eq(2)
    end
  end
end
