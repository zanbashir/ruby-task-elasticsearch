module Api
  module V1
    module Verticals
      class Destroy < BaseInteraction
        def execute
          vertical&.destroy || errors.add(:base, 'Not Found any vertical against this ID')
        end

        private

        def vertical
          @vertical ||= Vertical.find_by(id: params[:id])
        end
      end
    end
  end
end