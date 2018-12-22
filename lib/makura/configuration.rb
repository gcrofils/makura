# frozen_string_literal: true

module Makura
  class Configuration #:nodoc:
    attr_accessor :api_endpoint, :api_version

    def initialize
      @api_endpoint = nil
      @api_version  = nil
    end
  end
end
