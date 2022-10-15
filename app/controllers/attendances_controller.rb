class AttendancesController < ApplicationController
  before_action :set_event, only: %i[show destroy create]

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.user = current_user
    @attendance.event = @event
    authorize @attendance
    if @attendance.save
      redirect_to event_path(@event), notice: 'Attendance was successfully created.'
    else
      redirect_to @event, status: :unprocessable_entity, alert: 'Attendance was not created.'
    end
  end

  def destroy
    @attendance.destroy
    redirect_to event_path(@attendance.event), status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
    authorize @event
  end

  def attendance_params
    params.require(:attendance).permit(:attendance_status)
  end
end
