$:.unshift File.dirname(__FILE__)

module Sencha
  module Model
    require 'sencha-model/model'

    # Detect orm, include appropriate mixin.
    if defined?(ActiveRecord)
      require 'sencha-model/adapters/active_record'
    elsif defined?(DataMapper)
      require 'sencha-model/adapters/data_mapper'
    elsif defined?(MongoMapper)
      require 'sencha-model/adapters/mongo_mapper'
    end
  end
end

