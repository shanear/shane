class Thoughtworks::TeamsController < ApplicationController
  TOKEN = "TW4EVA8910"

  # Use simpler token verification logic
  skip_before_filter  :verify_authenticity_token
  before_filter :validate_token, only: :create

  def index
    @teams = Team.all
  end

  def create
    team = Team.new(params[:team])
    team.save

    respond_to do |format|
      format.json { render :json => {success: true} }
    end
  end

  private

  def validate_token
    redirect_to root_path and return false unless params[:token] == TOKEN
  end
end
