class TreatmentsController < ApplicationController
  before_action :set_appointment
  before_action :set_treatment, only: [:edit, :update, :destroy]

  def new; @treatment = @appointment.treatments.build; end

  def create
    @treatment = @appointment.treatments.build(treatment_params)
    if @treatment.save
      redirect_to @appointment, notice: 'Treatment added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def set_appointment; @appointment = Appointment.find(params[:appointment_id]); end
  def set_treatment; @treatment = @appointment.treatments.find(params[:id]); end
  def treatment_params; params.require(:treatment).permit(:description, :cost, :administered_at); end
end