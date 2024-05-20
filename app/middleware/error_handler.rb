# app/middleware/error_handler.rb
class ErrorHandler
  def initialize(app)
    @app = app
  end

  def call(env)
    @app.call(env)
  rescue ActiveRecord::RecordNotFound => e
    json_response({ errors: ["Record not found"] }, :not_found)
  rescue ActiveRecord::RecordInvalid => e
    json_response({ errors: e.record.errors.full_messages }, :unprocessable_entity)
  rescue StandardError => e
    json_response({ errors: [e.message] }, :internal_server_error)
  end

  private

  def json_response(body, status)
    [status, { 'Content-Type' => 'application/json' }, [body.to_json]]
  end
end
