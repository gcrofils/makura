# frozen_string_literal: true

require 'faraday'

module Makura
  # Connexion to Makura API
  class Base < JsonApiClient::Resource
    # defined in initializer
    self.site = Makura.configuration.api_endpoint

    # default paginator doesn't follow the specifications
    self.paginator = Paginator

    # Not strictly following the JSON Api spec
    # We set the vendor to Makura to lower the errors
    # and use the accept header to select the version of the API.
    connection do |conn|
      conn.faraday.headers['Accept'] = "application/vnd.makura.v#{Makura.configuration.api_version}+json"
      conn.faraday.headers['Content-Type'] = 'application/json'
    end
  end
end
