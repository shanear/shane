class Team < ActiveRecord::Base
  attr_accessible :name, :clue, :skips, :seconds

  validates_uniqueness_of :name
end
