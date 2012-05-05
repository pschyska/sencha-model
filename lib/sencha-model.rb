$:.unshift File.dirname(__FILE__)

begin
  require 'sequel'
rescue NameError
end

module Sencha
  module Model
    require 'sencha-model/model'

    # Detect orm, include appropriate mixin.
    if defined?(DataMapper)
      require 'sencha-model/adapters/data_mapper'
    elsif defined?(MongoMapper)
      require 'sencha-model/adapters/mongo_mapper'
    elsif defined?(Sequel)
      require 'sencha-model/adapters/sequel'
    else
      puts 'dum dum'
      require 'sencha-model/adapters/active_record'
    end
  end
end

