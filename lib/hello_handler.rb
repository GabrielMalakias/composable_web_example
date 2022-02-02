require 'oj'

class HelloHandler
  def call(request)
    [ 200, { 'Content-Type' => 'application/json' }, [Oj.dump(DB[:authors].all)] ]
  end
end
