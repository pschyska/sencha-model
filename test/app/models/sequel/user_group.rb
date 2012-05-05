class UserGroup < Sequel::Model
  belongs_to :user
  belongs_to :group
end
