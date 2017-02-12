class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :set_layout
  private
  def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer/)})
      Regexp.last_match[1]
    else
      'customer'
    end
  end

  # def current_staff_member
  #   if session[:staff_member_id]
  #     @current_staff_member ||=
  #       StaffMember.find_by(id: session[:staff_member_id])
  #   end
  # end

  # helper_method :current_staff_member
end
