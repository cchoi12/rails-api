module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |m|
      json_response({message: m.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |m|
      json_response({message: m.message}, :unprocessable_entity)
    end
  end
end
