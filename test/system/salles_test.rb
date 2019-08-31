require "application_system_test_case"

class SallesTest < ApplicationSystemTestCase
  setup do
    @salle = salles(:one)
  end

  test "visiting the index" do
    visit salles_url
    assert_selector "h1", text: "Salles"
  end

  test "creating a Salle" do
    visit salles_url
    click_on "New Salle"

    fill_in "Admin", with: @salle.admin_id
    fill_in "Ecole", with: @salle.ecole_id
    fill_in "Libelle", with: @salle.libelle
    fill_in "User", with: @salle.user_id
    click_on "Create Salle"

    assert_text "Salle was successfully created"
    click_on "Back"
  end

  test "updating a Salle" do
    visit salles_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @salle.admin_id
    fill_in "Ecole", with: @salle.ecole_id
    fill_in "Libelle", with: @salle.libelle
    fill_in "User", with: @salle.user_id
    click_on "Update Salle"

    assert_text "Salle was successfully updated"
    click_on "Back"
  end

  test "destroying a Salle" do
    visit salles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Salle was successfully destroyed"
  end
end
