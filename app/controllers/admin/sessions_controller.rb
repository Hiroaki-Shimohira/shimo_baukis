class Admin::SessionsController < Admin::Base
  skip_before_action :authorize
  def new
    if current_administrator
      redirect_to admin_root_path
    else
      @form = Admin::LoginForm.new
    end
  end

  def create
    @form = Admin::LoginForm.new(form_params)
    if @form.email.present?
      admin = Administrator.find_by(email_for_index: @form.email.downcase)
    end

    if Admin::Authenticator.new(admin).authenticate
      if admin.suspended?
        flash.alert = "アカウントが停止されています"
        redirect_to admin_login_path
      else
        session[:administrator_id] = admin.id
        flash.notice ="ログインしました"
        redirect_to admin_root_path
      end
    else
      flash.now.alert = "メアドが正しくありません"
      render "new"
    end
  end

  def destroy
    session.delete(:administrator_id)
    flash.notice = "ログアウトしました"
    redirect_to admin_root_path
  end

  private
    def form_params
      params.require(:admin_login_form).permit(:email)
    end
end
