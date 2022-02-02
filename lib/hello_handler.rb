class HelloHandler
  def call(request)
    puts DB[:authors].all.to_json

    [ 200, { }, [ "hello world" ] ]
  end
end
