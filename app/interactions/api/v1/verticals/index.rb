module Api
  module V1
    module Verticals
      class Index < BaseInteraction

        def execute
          Vertical.search(query: build_query).records
        end

        private

        def build_query
          params[:query].present? ? search_by_name : show_all
        end

        def search_by_name
          {
            query_string: {
              default_field: "name",
              query:"*#{params[:query]}*"
            }
          }
        end

        def show_all
          { "match_all": {} }
        end
      end
    end
  end
end