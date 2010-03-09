require 'whorm/model'

# Detect orm, include appropriate mixin.
if defined?(ActiveRecord)
  require 'whorm/adapters/active_record'
elsif defined?(DataMapper)
  require 'whorm/adapters/data_mapper'
elsif defined?(MongoMapper)
  require 'whorm/adapters/mongo_mapper'
end

module Whorm
  VERSION = "0.4.0"
end

