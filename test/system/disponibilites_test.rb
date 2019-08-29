require "application_system_test_case"

class DisponibilitesTest < ApplicationSystemTestCase
  setup do
    @disponibilite = disponibilites(:one)
  end

  test "visiting the index" do
    visit disponibilites_url
    assert_selector "h1", text: "Disponibilites"
  end

  test "creating a Disponibilite" do
    visit disponibilites_url
    click_on "New Disponibilite"

    fill_in "Admin", with: @disponibilite.admin_id
    fill_in "Creneau", with: @disponibilite.creneau_id
    fill_in "Ecole", with: @disponibilite.ecole_id
    fill_in "Enseignant", with: @disponibilite.enseignant_id
    fill_in "Jour", with: @disponibilite.jour_id
    fill_in "User", with: @disponibilite.user_id
    click_on "Create Disponibilite"

    assert_text "Disponibilite was successfully created"
    click_on "Back"
  end

  test "updating a Disponibilite" do
    visit disponibilites_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @disponibilite.admin_id
    fill_in "Creneau", with: @disponibilite.creneau_id
    fill_in "Ecole", with: @disponibilite.ecole_id
    fill_in "Enseignant", with: @disponibilite.enseignant_id
    fill_in "Jour", with: @disponibilite.jour_id
    fill_in "User", with: @disponibilite.user_id
    click_on "Update Disponibilite"

    assert_text "Disponibilite was successfully updated"
    click_on "Back"
  end

  test "destroying a Disponibilite" do
    visit disponibilites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Disponibilite was successfully destroyed"
  end
end
