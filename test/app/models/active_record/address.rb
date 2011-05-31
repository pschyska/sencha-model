class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  include Sencha::Model
end