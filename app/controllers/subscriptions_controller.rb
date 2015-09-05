API_KEY = ENV["MAILCHIMP_API_KEY"]
AMERITOCRACY_MAILING_LIST_ID = "27d69186a0";

class SubscriptionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    # CORS
    response.headers["Access-Control-Allow-Headers"] = 'Content-Type'
    response.headers["Access-Control-Allow-Methods"] = "POST"
    response.headers["Access-Control-Allow-Origin"] = "*"

    mailchimp = Mailchimp::API.new(API_KEY)
    mailchimp.lists.subscribe(AMERITOCRACY_MAILING_LIST_ID,
      {"email" => params[:email]}, nil, "html", false);

    render json: {success: true}
  end
end
