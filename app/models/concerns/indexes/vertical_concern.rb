module Indexes
  module VerticalConcern
    extend ActiveSupport::Concern

    included do
      include Elasticsearch::Model
      include Elasticsearch::Model::Callbacks

      settings index: { number_of_shards: 1 } do
        mappings dynamic: false do
          indexes :name, analyzer: 'english'
        end
      end

      def update_index
        __elasticsearch__.index_document
      end
    end
  end
end
