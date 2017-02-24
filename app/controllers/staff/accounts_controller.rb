class Staff::AccountsController < Staff::Base
  before_action :authorize
  def show
    @staff_member = current_staff_member
  end

  def edit
    @staff_member = current_staff_member
  end

  def update
    @staff_member = current_staff_member
    @staff_member.assign_attributes(staff_member_params)
    if @staff_member.save
      flash.notice = 'アカウント情報を更新しました。'
      redirect_to staff_acount_path
    else
      render "edit"
    end
  end

  private
  def staff_member_params
    params.require(:staff_member).premit(
      :email, :family_name, :given_name,
      :family_name_kana, :given_name_kana
    )
  end
end
