class User < ActiveRecord::Base
  include Sencha::Model
  belongs_to :person
  
  has_and_belongs_to_many :groups, :join_table => :user_groups
end