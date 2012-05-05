# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sencha-model/version"

Gem::Specification.new do |s|
  s.name        = "sencha-model"
  s.version     = Sencha::Model::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Chris Scott"]
  s.email       = ["christocracy@gmail.com"]
  s.homepage    = "http://www.440solutions.com"
  s.summary     = %q{This gem auto-generates ExtJS compatible model specifications from your ORM (eg: ActiveRecord, DataMapper, MongoMapper)}
  s.description = %q{This gem auto-generates ExtJS compatible model specifications from your ORM (eg: ActiveRecord, DataMapper, MongoMapper)}
    
  s.add_development_dependency "rake"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "mocha"
  s.add_development_dependency "extlib"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "activerecord", ">= 3.0.0"
  s.add_development_dependency "sequel"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end



# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

#Gem::Specification.new do |s|
#  s.name = %q{whorm}
#  s.version = "0.4.0"

#  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
#  s.authors = ["Chris Scott"]
#  s.date = %q{2010-03-09}
#  s.description = %q{Whorm contains a Model-mixin named Whorm::Model.  Once included, your Model now exposes a class-method named #whorm_schema which will return Hash representation of the Model-schema.}
#  s.email = %q{christocracy@gmail.com}
#  s.extra_rdoc_files = [
##    "LICENSE",
#     "README.rdoc"
#  ]
#  s.files = [
#    "LICENSE",
#     "README.rdoc",
#     "Rakefile",
#     "VERSION",
#     "lib/test/macros.rb",
#     "lib/whorm.rb",
#     "lib/whorm/adapters/active_record.rb",
#     "lib/whorm/adapters/data_mapper.rb",
#     "lib/whorm/adapters/mongo_mapper.rb",
#     "lib/whorm/model.rb",
#     "test/active_record_test.rb",
#     "test/app/config/application.rb",
#     "test/app/config/database.yml",
#     "test/app/db/schema.rb",
#     "test/app/models/active_record/address.rb",
#     "test/app/models/active_record/data_type.rb",
#     "test/app/models/active_record/group.rb",
#     "test/app/models/active_record/house.rb",
#     "test/app/models/active_record/location.rb",
#     "test/app/models/active_record/person.rb",
#     "test/app/models/active_record/user.rb",
#     "test/app/models/active_record/user_group.rb",
#     "test/data_mapper_test.rb",
#     "test/model_test.rb",
#     "test/mongo_mapper_test.rb",
#     "test/test_helper.rb"
#  ]
#  s.homepage = %q{http://github.com/christocracy/whorm}
#  s.rdoc_options = ["--charset=UTF-8"]
#  s.require_paths = ["lib"]
#  s.rubygems_version = %q{1.3.6}
#  s.summary = %q{Ruby ORM-inspecting tools to assist with generating JSON representations of database schemas and recordsets.}

#  if s.respond_to? :specification_version then
#    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
#    s.specification_version = 3

#    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
#      s.add_development_dependency(%q<shoulda>, [">= 0"])
#      s.add_development_dependency(%q<mocha>, [">= 0"])
#      s.add_development_dependency(%q<extlib>, [">= 0"])
#    else
#      s.add_dependency(%q<shoulda>, [">= 0"])
##      s.add_dependency(%q<mocha>, [">= 0"])
#      s.add_dependency(%q<extlib>, [">= 0"])
#    end
#  else
#    s.add_dependency(%q<shoulda>, [">= 0"])
#    s.add_dependency(%q<mocha>, [">= 0"])
#    s.add_dependency(%q<extlib>, [">= 0"])
#  end
#end

