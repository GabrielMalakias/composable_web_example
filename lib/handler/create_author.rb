# frozen_string_literal: true

class Handler::CreateAuthor
  def call(request)
    (Handler::Common.method(:read_json_from_request) >>
     Validate[Contract::Author] >>
     Repository::Author.method(:create) >>
     method(:serialize) >>
     Handler::Common.method(:build_ok_json_response)).call(request)
  rescue Error::Base => error
    Handler::Common.build_failed_json_response(error.to_json)
  end

  private

  def serialize(id)
    Oj.dump({ id: id })
  end
end

