class HelloHandler
  def call(request)
    puts request.inspect
    [ 200, { }, [ "hello world" ] ]
  end
end
