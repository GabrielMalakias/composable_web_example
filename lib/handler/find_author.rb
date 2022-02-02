read_from_query_string =  proc do |request|
  request["PATH_INFO"].split("/").last.to_i
end

find = proc do |id|
  DB[:authors].where(id: id)
end

serialize = proc do |object|
  Oj.dump(object.first)
end

build_response = proc do |json|
  [200, {'Content-Type' => 'application/json'}, [json]]
end

Handler::FindAuthor = read_from_query_string >> find >> serialize >> build_response
