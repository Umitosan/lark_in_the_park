module ExceptionHandler

  extend ActiveSupport::Concern

  included do

    rescue_from ActiveRecord::RecordNotFound do |exception|
      json_response({ message: exception.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |exception|
      json_response({ message: exception.message }, :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotSaved do |exception|
      json_response({ message: exception.message }, :bad_request)
    end

    rescue_from ActiveRecord::RecordNotDestroyed do |exception|
      json_response({ message: exception.message }, :unprocessable_entity)
    end

  end

end
