class SignupController < ApplicationController
  def create
    # create a new user
    user = User.new(user_params)

    # if the user was saved, generate a token
    if user.save
      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login

      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production?)
      render json: { csrf: tokens[:csrf]}
      # throw out an error
    else
      render json: { error: user.errors.full_messages.join(' ')}, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
