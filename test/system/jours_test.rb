require "application_system_test_case"

class JoursTest < ApplicationSystemTestCase
  setup do
    @jour = jours(:one)
  end

  test "visiting the index" do
    visit jours_url
    assert_selector "h1", text: "Jours"
  end

  test "creating a Jour" do
    visit jours_url
    click_on "New Jour"

    fill_in "Admin", with: @jour.admin_id
    fill_in "Ecole", with: @jour.ecole_id
    fill_in "Libelle", with: @jour.libelle
    fill_in "User", with: @jour.user_id
    click_on "Create Jour"

    assert_text "Jour was successfully created"
    click_on "Back"
  end

  test "updating a Jour" do
    visit jours_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @jour.admin_id
    fill_in "Ecole", with: @jour.ecole_id
    fill_in "Libelle", with: @jour.libelle
    fill_in "User", with: @jour.user_id
    click_on "Update Jour"

    assert_text "Jour was successfully updated"
    click_on "Back"
  end

  test "destroying a Jour" do
    visit jours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Jour was successfully destroyed"
  end
end
