class SigninController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]

#   used to login
  def create
    user = User.find_by(email: params[:email])

    if user.authenticate(params:[:password])
        payload = { user_id: user.id }
        session = JWTSession::Session.new(payload: payload, refresh_by_access_allowed: true)
        token = session.login
        response.set_cookie(JWTSessions.access_cookie, value: tokens[:access], httponly: true, secure: Rails.env.production?)
        render json: { crsf: tokens[:csrf]}
    else
        not_authorized
    end
  end

#   used to log out (destroy token)
  def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    render json: :ok
  end

  private
    def not_found
        render json: { error: "Cannot find email/password combination"}, status: :not_found
    end
  end
end
