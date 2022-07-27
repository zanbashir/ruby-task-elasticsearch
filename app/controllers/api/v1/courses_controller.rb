module Api
  module V1
    class CoursesController < Api::V1::ApplicationController

      def index
        render_response Api::V1::Courses::Index, params, each_serializer: CourseSerializer
      end

      def create
        render_response Api::V1::Courses::Create, params, serializer: CourseSerializer
      end

      def update
        render_response Api::V1::Courses::Update, params, serializer: CourseSerializer
      end

      def show
        render_response Api::V1::Courses::Show, params, serializer: CourseSerializer
      end

      def destroy
        render_response Api::V1::Courses::Destroy, params, serializer: CourseSerializer
      end
    end
  end
end
