module Indexes
  module CourseConcern
    extend ActiveSupport::Concern

    included do
      include Elasticsearch::Model
      include Elasticsearch::Model::Callbacks

      settings index: { number_of_shards: 1 } do
        mappings dynamic: false do
          indexes :category_id
          indexes :name, analyzer: 'english'
          indexes :author, analyzer: 'english'
          indexes :state
        end
      end

      def update_index
        __elasticsearch__.index_document
      end
    end
  end
end
