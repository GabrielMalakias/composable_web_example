# frozen_string_literal: true
validate = proc do |params|
  result = Contract::Author.validate(params)

  raise Error::Validation.new(result.errors.to_h) if result.failure?

  result.to_h
end

serialize = proc do |id|
  Oj.dump({ id: id })
end

Handler::CreateAuthor = proc do |request|
  (Handler::Common.method(:read_json_from_request) >>
  validate >>
  Repository::Author.method(:create) >>
  serialize >>
  Handler::Common.method(:build_ok_json_response)).call(request)
rescue StandardError => error
  puts error.backtrace
  Handler::Common.build_failed_json_response(error.to_json)
end
