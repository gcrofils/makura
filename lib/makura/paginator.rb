# frozen_string_literal: true

module Makura
  # Kaminari compatible paginator
  class Paginator
    class_attribute :page_param,
                    :per_page_param

    self.page_param = 'number'
    self.per_page_param = 'size'

    attr_reader :params, :result_set, :links, :meta

    def initialize(result_set, data)
      @params = params_for_uri(result_set.uri)
      @result_set = result_set
      @links = data['links']
      @meta = data['meta']
    end

    def next
      result_set.links.fetch_link('next')
    end

    def prev
      result_set.links.fetch_link('prev')
    end

    def first
      result_set.links.fetch_link('first')
    end

    def last
      result_set.links.fetch_link('last')
    end

    def total_pages
      meta['totalPages']
    end

    def total_entries
      meta['totalCount']
    end
    alias total_count total_entries

    def offset
      per_page * (current_page - 1)
    end

    def per_page
      params.fetch("page[#{per_page_param}]") do
        result_set.length
      end.to_i
    end
    alias limit_value per_page

    def current_page
      params.fetch("page[#{page_param}]", 1).to_i
    end

    def out_of_bounds?
      current_page > total_pages
    end

    def previous_page
      current_page > 1 ? (current_page - 1) : nil
    end

    def next_page
      current_page < total_pages ? (current_page + 1) : nil
    end

    protected

    def params_for_uri(uri)
      return {} unless uri

      uri = Addressable::URI.parse(uri)
      (uri.query_values || {}).with_indifferent_access
    end
  end
end
