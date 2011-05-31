class Person < ActiveRecord::Base
  has_one :user
  include Sencha::Model
end