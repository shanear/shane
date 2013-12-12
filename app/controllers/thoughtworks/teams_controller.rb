class Thoughtworks::TeamsController < ApplicationController
  TOKEN = "TW4EVA8910"

  # Use simpler token verification logic
  skip_before_filter :verify_authenticity_token
  before_filter :validate_token, only: [:create, :update]

  def index
    @teams = Team.all
  end

  def create
    team = Team.new(params[:team])

    respond_to do |format|
      if team.save
        format.json { render :json => {success: true} }
      else
        format.json { render :json => {success: false} }
      end
    end
  end

  def update
    @team = Team.where(name: params[:id]).first

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.json { render :json => {success: true} }
      end
    end
  end

  private

  def validate_token
    redirect_to root_path and return false unless (params[:token] == TOKEN)
  end
end