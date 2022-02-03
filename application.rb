# frozen_string_literal: true

require 'agoo'
require 'sequel'
require 'zeitwerk'
require 'oj'
require 'dry-validation'

class Application
  DB = Sequel.connect('postgres://localhost:5432', user: 'postgres', password: '123')

  def self.load_files
    loader = Zeitwerk::Loader.new
    loader.push_dir('./lib')
    loader.setup
  end

  def self.start!
    Agoo::Server.init(3000, 'root')
    Agoo::Server.handle(:POST, '/authors', Handler::CreateAuthor)
    Agoo::Server.handle(:GET, '/authors/*', Handler::FindAuthor)
    Agoo::Server.start
  end
end

Application.load_files
