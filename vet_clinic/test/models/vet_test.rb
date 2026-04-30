require "test_helper"

class VetTest < ActiveSupport::TestCase
  test "should save valid vet" do
    vet = Vet.new(first_name: "Ana", last_name: "Perez", email: "ana@vet.com", phone: "123", specialization: "Cirugía")
    assert vet.save, "Failed to save the valid vet"
  end

  test "should not save vet without required fields" do
    vet = Vet.new(first_name: "Ana")
    assert_not vet.save, "Saved the vet without all required fields"
  end

  test "email must be valid" do
    vet = Vet.new(first_name: "Ana", last_name: "Perez", email: "correo_invalido", phone: "123", specialization: "Cirugía")
    assert_not vet.save, "Saved vet with invalid email format"
  end
end