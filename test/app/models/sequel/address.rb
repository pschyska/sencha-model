class Address < Sequel::Model
  many_to_one :addressable, :polymorphic => true
  include Sencha::Model
end
