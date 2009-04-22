class Actor < ActiveRecord::Base
  belongs_to :encounter
  attr_accessor :current_health
end
