require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir('./lib')
loader.setup
loader.eager_load