module Api
  module V1
    class VerticalsController < Api::V1::ApplicationController

      def index
        render_response Api::V1::Verticals::Index, params, each_serializer: VerticalSerializer
      end

      def create
        render_response Api::V1::Verticals::Create, params, serializer: VerticalSerializer
      end

      def update
        render_response Api::V1::Verticals::Update, params, serializer: VerticalSerializer
      end

      def show
        render_response Api::V1::Verticals::Show, params, serializer: VerticalSerializer
      end

      def destroy
        render_response Api::V1::Verticals::Destroy, params, serializer: VerticalSerializer
      end
    end
  end
end
