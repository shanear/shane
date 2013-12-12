class Team < ActiveRecord::Base
  attr_accessible :name, :clue, :skips, :seconds
end
