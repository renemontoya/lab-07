class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]

  # GET /appointments
  def index
    @appointments = Appointment.includes(pet: :owner).all
  end

  # GET /appointments/1
  def show
    # Mantener el .includes para el punto B.3 (Optimización N+1)
    @appointment = Appointment.includes(treatments: :rich_text_clinical_notes).find(params[:id])
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointment_url(@appointment), notice: "Cita creada con éxito."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      redirect_to appointment_url(@appointment), notice: "Cita actualizada con éxito."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: "Cita eliminada correctamente."
  end

  private

  # Método para buscar la cita antes de cada acción
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Parámetros permitidos (Asegúrate de que coincidan con tus campos del Lab 6)
  def appointment_params
    params.require(:appointment).permit(:date, :reason, :status, :pet_id, :vet_id)
  end
end