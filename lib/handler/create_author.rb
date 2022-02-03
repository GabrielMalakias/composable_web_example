# frozen_string_literal: true

read_input_and_parse = proc do |request|
  Oj.load(request['rack.input'].read)
end

validate = proc do |params|
  Contract::Author.new.call(params).to_h
end

insert = proc do |params|
  DB[:authors].insert(params)
end

serialize = proc do |id|
  Oj.dump({ id: id })
end

build_response = proc do |json|
  [200, { 'Content-Type' => 'application/json' }, [json]]
end

Handler::CreateAuthor = read_input_and_parse >> validate >> insert >> serialize >> build_response
