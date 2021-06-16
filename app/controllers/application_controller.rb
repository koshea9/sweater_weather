class ApplicationController < ActionController::API
  rescue_from LocationMissing,
              InvalidCredentials,
  with: :render_error_response

  def render_error_response(exception)
    render json: { errors: [{status: exception.code, detail: exception.detail }]}, status: exception.http_status
  end

  private

  def error_message(errors)
    errors.full_messages.join(', ')
  end
end
