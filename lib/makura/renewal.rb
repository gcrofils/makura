# frozen_string_literal: true

module Makura
  class Renewal < Base #:nodoc:
    # IDs
    property :id, type: :string
    property :contract_id, type: :string
    property :customer_id, type: :string
    property :provider_id, type: :string

    # Renewal attributes
    property :scheduled_at, type: :time
    property :state, type: :string
    property :data, type: :string
    property :created_at, type: :time
    property :updated_at, type: :time

    # Contract attributes
    property :started_at, type: :time
    property :deadline_at, type: :time
    property :ended_at, type: :time
    property :duration, type: :integer
    property :bonus, type: :boolean
    property :started_reliability, type: :string

    # Attributes cached in Contract
    property :customer_name, type: :string
    property :customer_gender, type: :string

    def confirmations
      Confirmation.where(renewal_id: id).to_a
    end
  end
end
