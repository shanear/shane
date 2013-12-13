class Team < ActiveRecord::Base
  attr_accessible :name, :clue, :skips, :seconds

  validates_uniqueness_of :name

  CLUE_POSITIONS = {
    "LilTurts" => 1,
    "Stumpy" => 2,
    "Whatever" => 3,
    "Rudolph" => 4,
    "KevinBeacon" => 5,
    "Gilbert" => 6,
  }

  scope :by_winning, -> {
    order("skips ASC");
  }

  def clue_position
    CLUE_POSITIONS[clue] || 0
  end
end
