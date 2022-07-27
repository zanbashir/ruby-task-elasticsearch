module Api
  module V1
    class ApplicationController < ActionController::Base
      skip_before_action :verify_authenticity_token

      before_action :doorkeeper_authorize!
      respond_to    :json

      def render_response(interaction_class, request_params, render_options = {})
        outcome = interaction_class.run(params: request_params)

        if block_given?
          yield(outcome)
        elsif outcome.valid?
          render({ json: outcome.result, status: :ok }.merge(render_options))
        else
          render json: { errors: outcome.errors.full_messages }, status: :bad_request
        end
      end

    end
  end
end
