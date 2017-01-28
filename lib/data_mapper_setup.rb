require 'data_mapper'
require 'dm-postgres-adapter'

# require_relative './lib/models/...'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade! # toggle to make Rakefile work!