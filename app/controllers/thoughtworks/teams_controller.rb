class Thoughtworks::TeamsController < ApplicationController
  TOKEN = "TW4EVA8910"

  before_filter :validate_token, only: :create

  def index
    @teams = Team.all
  end

  def create
    team = Team.new(params[:team])
    team.save

    render nil
  end

  private

  def validate_token
    redirect_to root_path and return false unless params[:token] == TOKEN
  end
end
