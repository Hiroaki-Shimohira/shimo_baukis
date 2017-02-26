class Admin::StaffEventsController < Admin::Base
  def index
    if params[:staff_member_id]
      @staff_member = StaffMember.find(params[:staff_member_id])
      @events = @staff_member.staff_events
    else
      @events = StaffEvent.all
    end
    @events = @events.order(occurred_at: :desc).includes(:staff_member).page(params[:page])
  end
end
