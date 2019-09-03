require "application_system_test_case"

class VersementsTest < ApplicationSystemTestCase
  setup do
    @versement = versements(:one)
  end

  test "visiting the index" do
    visit versements_url
    assert_selector "h1", text: "Versements"
  end

  test "creating a Versement" do
    visit versements_url
    click_on "New Versement"

    fill_in "Annee", with: @versement.annee_id
    fill_in "Ecole", with: @versement.ecole_id
    fill_in "Etudiant", with: @versement.etudiant_id
    fill_in "Montant", with: @versement.montant
    fill_in "User", with: @versement.user_id
    click_on "Create Versement"

    assert_text "Versement was successfully created"
    click_on "Back"
  end

  test "updating a Versement" do
    visit versements_url
    click_on "Edit", match: :first

    fill_in "Annee", with: @versement.annee_id
    fill_in "Ecole", with: @versement.ecole_id
    fill_in "Etudiant", with: @versement.etudiant_id
    fill_in "Montant", with: @versement.montant
    fill_in "User", with: @versement.user_id
    click_on "Update Versement"

    assert_text "Versement was successfully updated"
    click_on "Back"
  end

  test "destroying a Versement" do
    visit versements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Versement was successfully destroyed"
  end
end
