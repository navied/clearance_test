class SessionsController < Clearance::UsersController
  include NavHelper
  skip_before_action :require_login , :only => [:new, :create]

  def create
    @user = authenticate(params)
    sign_in(@user) do |status|
      if status.success?
        redirect_back_or url_after_create
      else
        flash.now.notice = status.failure_message
        render template: "sessions/new", status: :unauthorized
      end
    end
  end

  def new
    render template: "sessions/new"
  end

  def destroy
    if cookies[:admin_remember_token].blank?
      sign_out
      redirect_to sign_in_path
    else
      user = User.where(:remember_token => cookies[:admin_remember_token]).first
      cookies.each do |cookie|
        cookies.delete(cookie[0])
      end
      reset_session
      sign_in(user) do |status|
        redirect_to sign_in_path
      end
    end
  end

  private

  def url_after_create
    root_path
  end
end
