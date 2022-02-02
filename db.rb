require 'sequel'

DB = Sequel.connect('sqlite://blog.db')
DB[:authors].insert(name: 'Testing')
