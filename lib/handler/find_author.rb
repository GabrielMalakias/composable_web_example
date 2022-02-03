# frozen_string_literal: true

serialize = proc do |object|
  Oj.dump(object)
end

Handler::FindAuthor =
  Handler::Common.method(:read_id_from_request) >>
  Repository::Author.method(:find) >>
  serialize >>
  Handler::Common.method(:build_ok_json_response)
