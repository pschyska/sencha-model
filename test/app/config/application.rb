# TODO: Figure out how to iterate each ORM framework AR, DM, MM and test each.
require 'active_record'
require 'active_support'
require 'sencha-model'
require 'extlib/inflection'
require 'sqlite3'

class Test::App
  
  attr_reader :models
  
  def initialize(orm = :active_record)
    @orm = orm
    @config = YAML::load(IO.read("#{ROOT}/config/database.yml"))
    
    # Load ORM
    send("boot_#{orm.to_s}")
    load_models

    require 'db/schema'
    
  end
  
  ##
  # Reset a model's @sencha_fieldsets
  #
  def clean_all
    @models.map { |klass| clean klass }
  end
  
  
private
  
  def boot_active_record
    ActiveRecord::Base.establish_connection(@config['test'])
  end
  
  def boot_mongo_mapper
    
  end
  
  def boot_data_mapper
    
  end

  def boot_sequel
    require 'sequel'
    $db = ::Sequel.connect("sqlite://db/test.sqlite3")
    require './vendor/gems/sequel_polymorphic/lib/sequel_polymorphic.rb'
    Sequel::Model.extend Sequel::Plugins::Polymorphic::ClassMethods
    # also boot AR because schema is dependant on it
    boot_active_record
  end
  
  ##
  # Do a dir on /models and constantize each filename
  #
  def load_models
    @models = []
    # Load Models and Schema for corresponding orm
    re = /^.*\/(.*).rb$/
    Dir["#{ROOT}/models/#{@orm.to_s}/*"].each { |c| 
        require c 
        match = c.match(re)
        @models << Extlib::Inflection.constantize(Extlib::Inflection.camelize(match[1])) if match
    }
  end
  
  def clean klass
    klass.instance_variables.each do |var_name|
      if /\A@sencha_fieldsets__/ =~ var_name.to_s
        klass.instance_variable_set( var_name.to_sym, nil )
      end
    end
  end
  
end
