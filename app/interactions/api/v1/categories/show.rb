module Api
  module V1
    module Categories
      class Show < BaseInteraction

        def execute
          category.presence || errors.add(:base, 'Unable to find category')
        end

        private

        def category
          @category ||= Category.find_by(id: params[:id])
        end
      end
    end
  end
end