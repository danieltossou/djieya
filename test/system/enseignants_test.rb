require "application_system_test_case"

class EnseignantsTest < ApplicationSystemTestCase
  setup do
    @enseignant = enseignants(:one)
  end

  test "visiting the index" do
    visit enseignants_url
    assert_selector "h1", text: "Enseignants"
  end

  test "creating a Enseignant" do
    visit enseignants_url
    click_on "New Enseignant"

    fill_in "Admin", with: @enseignant.admin_id
    fill_in "Adresse", with: @enseignant.adresse
    fill_in "Contact", with: @enseignant.contact
    fill_in "Ecole", with: @enseignant.ecole_id
    fill_in "Email", with: @enseignant.email
    fill_in "Nom", with: @enseignant.nom
    fill_in "Prenom", with: @enseignant.prenom
    fill_in "User", with: @enseignant.user_id
    click_on "Create Enseignant"

    assert_text "Enseignant was successfully created"
    click_on "Back"
  end

  test "updating a Enseignant" do
    visit enseignants_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @enseignant.admin_id
    fill_in "Adresse", with: @enseignant.adresse
    fill_in "Contact", with: @enseignant.contact
    fill_in "Ecole", with: @enseignant.ecole_id
    fill_in "Email", with: @enseignant.email
    fill_in "Nom", with: @enseignant.nom
    fill_in "Prenom", with: @enseignant.prenom
    fill_in "User", with: @enseignant.user_id
    click_on "Update Enseignant"

    assert_text "Enseignant was successfully updated"
    click_on "Back"
  end

  test "destroying a Enseignant" do
    visit enseignants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Enseignant was successfully destroyed"
  end
end
