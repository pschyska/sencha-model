class Person < Sequel::Model
  one_to_one :user
  include Sencha::Model
end
