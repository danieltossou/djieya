require "application_system_test_case"

class EcolesTest < ApplicationSystemTestCase
  setup do
    @ecole = ecoles(:one)
  end

  test "visiting the index" do
    visit ecoles_url
    assert_selector "h1", text: "Ecoles"
  end

  test "creating a Ecole" do
    visit ecoles_url
    click_on "New Ecole"

    check "Etat" if @ecole.etat
    fill_in "Libelle", with: @ecole.libelle
    fill_in "User", with: @ecole.user_id
    click_on "Create Ecole"

    assert_text "Ecole was successfully created"
    click_on "Back"
  end

  test "updating a Ecole" do
    visit ecoles_url
    click_on "Edit", match: :first

    check "Etat" if @ecole.etat
    fill_in "Libelle", with: @ecole.libelle
    fill_in "User", with: @ecole.user_id
    click_on "Update Ecole"

    assert_text "Ecole was successfully updated"
    click_on "Back"
  end

  test "destroying a Ecole" do
    visit ecoles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ecole was successfully destroyed"
  end
end
