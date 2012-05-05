class User < Sequel::Model
  include Sencha::Model
  belongs_to :person

  many_to_many :groups, :join_table => :user_groups
end
