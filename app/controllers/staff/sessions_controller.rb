class Staff::SessionsController < Staff::Base
  skip_before_action :authorize
  def new
    if current_staff_member
      redirect_to staff_root_path
    else
      @form = Staff::LoginForm.new
    end
  end

  def create
    @form = Staff::LoginForm.new(form_params)
    if @form.email.present?
      staff_member = StaffMember.find_by(email_for_index: @form.email.downcase)
    end

    if Staff::Authenticator.new(staff_member).authenticate(@form.password)
      if staff_member.suspended?
        flash.alert = "アカウントが停止されています"
        redirect_to staff_login_path
      else
        session[:staff_member_id]=staff_member.id
        flash.notice = "ログインしました"
        redirect_to staff_root_path
      end
    else
      flash.now.alert = "メールアドレスまたはパスワードが正しくありません"
      render "new"
    end
  end

  def destroy
    session.delete(:staff_member_id)
    flash.notice = "ログアウトしました"
    redirect_to staff_root_path
  end

  private
  def form_params
    params.require(:staff_login_form).permit(:email,:password)
  end
end
