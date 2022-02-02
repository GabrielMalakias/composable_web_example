require 'agoo'
require_relative 'loader'
require_relative 'db'

Agoo::Server.init(3000, 'root')

Agoo::Server.handle(:GET, "/hello", HelloHandler.new)
Agoo::Server.start()

