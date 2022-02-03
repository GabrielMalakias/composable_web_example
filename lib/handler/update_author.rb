read_input_and_parse = proc do |request|
  Oj.load(request['rack.input'].read)
end

validate = proc do |params|
  Contract::Author.new.call(params).to_h
end


