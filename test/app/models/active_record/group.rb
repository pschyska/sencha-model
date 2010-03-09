class Group < ActiveRecord::Base
  has_many :users
  include Whorm::Model
end