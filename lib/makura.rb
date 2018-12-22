# frozen_string_literal: true

require 'json_api_client'

module Makura #:nodoc:
  autoload :Configuration, 'makura/configuration'
  autoload :Base, 'makura/base'
  autoload :Contract, 'makura/contract'
  autoload :Renewal, 'makura/renewal'
  autoload :Confirmation, 'makura/confirmation'
  autoload :Paginator, 'makura/paginator'
  autoload :VERSION, 'makura/version'

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
