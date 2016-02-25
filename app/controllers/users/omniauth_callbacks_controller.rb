class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_filter :authenticate_user! , only:[:stripe_connect]
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end
  def stripe_connect
    auth = request.env["omniauth.auth"]
    @user = current_user
    if @user.update_attributes({
      provider: auth.provider,
      uid: auth.uid,
      access_token: auth.credentials.token,
      publishable_key: auth.info.stripe_publishable_key
    })
      # anything else you need to do in response..
      sign_in(@user)
      redirect_to users_path, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Stripe") if is_navigational_format?
    else
      session["devise.stripe_connect_data"] = auth
      redirect_to new_user_registration_url
    end
  end
  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
