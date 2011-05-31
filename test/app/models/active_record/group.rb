class Group < ActiveRecord::Base
  has_many :users
  include Sencha::Model
end