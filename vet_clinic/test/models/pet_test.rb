require "test_helper"

class PetTest < ActiveSupport::TestCase
  def setup
    @owner = owners(:one) # Usa los fixtures que trae Rails por defecto
  end

  test "should not save pet without name" do
    pet = Pet.new(species: "dog", weight: 10, date_of_birth: 1.year.ago, owner: @owner)
    assert_not pet.save, "Saved the pet without a name"
  end

  test "should not save pet with weight 0 or less" do
    pet = Pet.new(name: "Rex", species: "dog", weight: 0, date_of_birth: 1.year.ago, owner: @owner)
    assert_not pet.save, "Saved the pet with invalid weight"
  end

  test "should not save pet with future date of birth" do
    pet = Pet.new(name: "Rex", species: "dog", weight: 10, date_of_birth: Date.tomorrow, owner: @owner)
    assert_not pet.save, "Saved the pet with a future date of birth"
  end

  test "should not save pet with invalid species" do
    pet = Pet.new(name: "Rex", species: "dragon", weight: 10, date_of_birth: 1.year.ago, owner: @owner)
    assert_not pet.save, "Saved the pet with an invalid species"
  end
end