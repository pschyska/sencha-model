class Location < Sequel::Model
  one_to_one :address, :as => :addressable
  include Sencha::Model
end

