module Api
  module V1
    class CategoriesController < Api::V1::ApplicationController

      def index
        render_response Api::V1::Categories::Index, params, each_serializer: CategorySerializer
      end

      def create
        render_response Api::V1::Categories::Create, params, serializer: CategorySerializer
      end

      def update
        render_response Api::V1::Categories::Update, params, serializer: CategorySerializer
      end

      def show
        render_response Api::V1::Categories::Show, params, serializer: CategorySerializer
      end

      def destroy
        render_response Api::V1::Categories::Destroy, params, serializer: CategorySerializer
      end
    end
  end
end
