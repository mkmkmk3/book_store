# frozen_string_literal: true

module Controllers
  # コントローラーのエラーハンドリング処理
  module ErrorHandling
    extend ActiveSupport::Concern

    included do
      if Rails.env.production?
        rescue_from StandardError, with: :render_500
        rescue_from ActiveRecord::RecordNotFound, with: :render_404
        rescue_from ActionController::RoutingError, with: :render_404
      end
    end

    def routing_error
      raise ActionController::RoutingError, "No route matches #{request.path.inspect}"
    end

    private

    def render_500(ex = nil)
      logger.error ex.message if ex
      respond_to do |format|
        format.html { render template: 'errors/500', status: 500 }
        format.json { render json: { code: 500, error: '予期せぬエラーが発生しました' }, status: 500 }
      end
    end

    def render_404(ex = nil)
      logger.warn ex.message if ex
      respond_to do |format|
        format.html { render template: 'errors/404', status: 404 }
        format.json { render json: { code: 404, error: 'ページが見つかりませんでした' }, status: 404 }
      end
    end
  end
end

