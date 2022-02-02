require 'agoo'
require 'loader'

Agoo::Server.init(3000, 'root')

Agoo::Server.handle(:GET, "/hello", HelloHandler.new)
Agoo::Server.start()

