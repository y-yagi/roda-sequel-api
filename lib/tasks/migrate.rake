migrate = -> (env, version) do
  ENV['RACK_ENV'] = env
  require_relative "#{PROJ_ROOT}/db"
  require 'logger'
  Sequel.extension :migration
  DB.loggers << Logger.new($stdout)
  Sequel::Migrator.apply(DB, "#{PROJ_ROOT}/migrate", version)
end

desc "Migrate test database to latest version"
task :test_up do
  migrate.call('test', nil)
end

desc "Migrate test database all the way down"
task :test_down do
  migrate.call('test', 0)
end

desc "Migrate development database to latest version"
task :dev_up do
  migrate.call('development', nil)
end

desc "Migrate development database to latest version"
task :dev_down do
  migrate.call('development', 0)
end

desc "Migrate production database to latest version"
task :prod_up do
  migrate.call('production', nil)
end

