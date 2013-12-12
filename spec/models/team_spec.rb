require_relative '../spec_helper'

describe Team do
  before do
    @team = Team.new
  end

  describe "#valid?" do
    it "doesn't allow duplicate names" do
      Team.create(name: "TeamName")
      @team.name = "TeamName"
      @team.should_not be_valid
    end
  end
end
