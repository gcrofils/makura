# frozen_string_literal: true

module Makura
  class Contract < Base #:nodoc:
    # common properties
    property :id, type: :string
    property :contract_type, type: :string
    property :owner_id, type: :string
    property :provider_id, type: :string
    property :started_at, type: :time
    property :deadline_at, type: :time
    property :ended_at, type: :time
    property :created_at, type: :time
    property :updated_at, type: :time

    # contract Characteristics for
    # gas, electricity, heating_electricity
    property :duration_seconds, type: :integer
    property :bonus, type: :boolean
    property :started_reliabilty, type: :string
  end
end
