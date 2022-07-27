module Api
  module V1
    module Courses
      class Destroy < BaseInteraction

        def execute
          course&.destroy || errors.add(:base, 'Unable to find course')
        end

        private

        def course
          @course ||= Course.find_by(id: params[:id])
        end
      end
    end
  end
end