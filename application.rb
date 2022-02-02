require 'agoo'
require 'sequel'
require 'zeitwerk'
require 'oj'
require 'dry-validation'


# Setup database connection
DB = Sequel.connect('postgres://localhost:5432', user: 'postgres', password: '123')

# Load files
loader = Zeitwerk::Loader.new
loader.push_dir('./lib')
loader.setup
loader.eager_load


# Server and routing
Agoo::Server.init(3000, 'root')
Agoo::Server.handle(:POST, "/authors", Handler::CreateAuthor)
Agoo::Server.handle(:GET, "/authors/*", Handler::FindAuthor)
Agoo::Server.start()
