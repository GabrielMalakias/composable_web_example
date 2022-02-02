namespace :db do
  task :migrate, [:version] do |t, args|
    require "sequel/core"
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect('sqlite://blog.db') do |db|
      Sequel::Migrator.run(db, "db/migrations", target: version)
    end
  end
end
