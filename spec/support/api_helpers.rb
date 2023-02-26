module ApiHelpers
  def json_body
    JSON.parse(response.body).deep_symbolize_keys
  end
end

RSpec.configure do |config|
  config.include ApiHelpers, type: :request
end
