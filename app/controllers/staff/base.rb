class Staff::Base < ApplicationController
  private
  def current_staff_member
    if session[:staff_member_id]
      @current_staff_member ||=
        StaffMember.find_by_id(session[:staff_member_id])
    end
  end
  def authorize
    unless current_staff_member
      flash.alert = "職員としてログインしてください"
      redirect_to staff_login_path
    end
  end
  helper_method :current_staff_member
end
