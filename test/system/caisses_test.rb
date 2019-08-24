require "application_system_test_case"

class CaissesTest < ApplicationSystemTestCase
  setup do
    @caiss = caisses(:one)
  end

  test "visiting the index" do
    visit caisses_url
    assert_selector "h1", text: "Caisses"
  end

  test "creating a Caisse" do
    visit caisses_url
    click_on "New Caisse"

    fill_in "Annee", with: @caiss.annee_id
    fill_in "Ecole", with: @caiss.ecole_id
    fill_in "Libelle", with: @caiss.libelle
    fill_in "Montant", with: @caiss.montant
    fill_in "Operation", with: @caiss.operation
    fill_in "User", with: @caiss.user_id
    click_on "Create Caisse"

    assert_text "Caisse was successfully created"
    click_on "Back"
  end

  test "updating a Caisse" do
    visit caisses_url
    click_on "Edit", match: :first

    fill_in "Annee", with: @caiss.annee_id
    fill_in "Ecole", with: @caiss.ecole_id
    fill_in "Libelle", with: @caiss.libelle
    fill_in "Montant", with: @caiss.montant
    fill_in "Operation", with: @caiss.operation
    fill_in "User", with: @caiss.user_id
    click_on "Update Caisse"

    assert_text "Caisse was successfully updated"
    click_on "Back"
  end

  test "destroying a Caisse" do
    visit caisses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Caisse was successfully destroyed"
  end
end
