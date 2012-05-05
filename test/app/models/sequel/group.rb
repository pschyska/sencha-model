class Group < Sequel::Model
  one_to_many :users
  include Sencha::Model
end
