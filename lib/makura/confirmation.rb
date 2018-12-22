# frozen_string_literal: true

module Makura
  class Confirmation < Base #:nodoc:
    property :id, type: :string
    property :renewal_id, type: :string
    property :slug, type: :string
    property :origin, type: :string
    property :current, type: :string
    property :source, type: :string
    property :confirmed_at, type: :time
    property :created_at, type: :time
    property :updated_at, type: :time
  end
end
