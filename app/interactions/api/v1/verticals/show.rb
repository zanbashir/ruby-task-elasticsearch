module Api
  module V1
    module Verticals
      class Show < BaseInteraction
        def execute
          vertical.presence || errors.add(:base, 'vertical not exist with matching id')
        end

        private

        def vertical
          @vertical ||= Vertical.find_by(id: params[:id])
        end
      end
    end
  end
end
