require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  def setup
    @pet = pets(:one)
    @vet = vets(:one)
  end

  test "should save valid appointment" do
    appointment = Appointment.new(date: Date.tomorrow, reason: "Control", status: :scheduled, pet: @pet, vet: @vet)
    assert appointment.save, "Failed to save valid appointment"
  end

  test "should have default status or specific enum" do
    appointment = Appointment.new(date: Date.tomorrow, reason: "Control", status: "completed", pet: @pet, vet: @vet)
    assert_equal "completed", appointment.status
  end
end