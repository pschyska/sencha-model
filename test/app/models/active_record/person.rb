class Person < ActiveRecord::Base
  has_one :user
  include Whorm::Model
end