class Admin::Base < ApplicationController
  private
  def current_administrator
    if session[:administrator_id]
      @current_administrator ||=
        Administrator.find_by(id: session[:administrator_id])
    end
  end
  def authorize
    unless current_administrator
      falsh.notice = "管理者としてログインしてください"
      redirect_to admin_login_path
    end
  end
  helper_method :current_administrator
end