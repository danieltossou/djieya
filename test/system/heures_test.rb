require "application_system_test_case"

class HeuresTest < ApplicationSystemTestCase
  setup do
    @heure = heures(:one)
  end

  test "visiting the index" do
    visit heures_url
    assert_selector "h1", text: "Heures"
  end

  test "creating a Heure" do
    visit heures_url
    click_on "New Heure"

    fill_in "Admin", with: @heure.admin_id
    fill_in "Ecole", with: @heure.ecole_id
    fill_in "Libelle", with: @heure.libelle
    fill_in "User", with: @heure.user_id
    click_on "Create Heure"

    assert_text "Heure was successfully created"
    click_on "Back"
  end

  test "updating a Heure" do
    visit heures_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @heure.admin_id
    fill_in "Ecole", with: @heure.ecole_id
    fill_in "Libelle", with: @heure.libelle
    fill_in "User", with: @heure.user_id
    click_on "Update Heure"

    assert_text "Heure was successfully updated"
    click_on "Back"
  end

  test "destroying a Heure" do
    visit heures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Heure was successfully destroyed"
  end
end
