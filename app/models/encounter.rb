class Encounter < ActiveRecord::Base
  has_many :actors, :order => "initiative DESC"
end
