require "application_system_test_case"

class DossiersTest < ApplicationSystemTestCase
  setup do
    @dossier = dossiers(:one)
  end

  test "visiting the index" do
    visit dossiers_url
    assert_selector "h1", text: "Dossiers"
  end

  test "creating a Dossier" do
    visit dossiers_url
    click_on "New Dossier"

    fill_in "Ecole", with: @dossier.ecole_id
    fill_in "Libelle", with: @dossier.libelle
    click_on "Create Dossier"

    assert_text "Dossier was successfully created"
    click_on "Back"
  end

  test "updating a Dossier" do
    visit dossiers_url
    click_on "Edit", match: :first

    fill_in "Ecole", with: @dossier.ecole_id
    fill_in "Libelle", with: @dossier.libelle
    click_on "Update Dossier"

    assert_text "Dossier was successfully updated"
    click_on "Back"
  end

  test "destroying a Dossier" do
    visit dossiers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dossier was successfully destroyed"
  end
end
