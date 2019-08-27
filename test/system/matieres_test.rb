require "application_system_test_case"

class MatieresTest < ApplicationSystemTestCase
  setup do
    @matiere = matieres(:one)
  end

  test "visiting the index" do
    visit matieres_url
    assert_selector "h1", text: "Matieres"
  end

  test "creating a Matiere" do
    visit matieres_url
    click_on "New Matiere"

    fill_in "Admin", with: @matiere.admin_id
    fill_in "Ecole", with: @matiere.ecole_id
    fill_in "Libelle", with: @matiere.libelle
    fill_in "User", with: @matiere.user_id
    click_on "Create Matiere"

    assert_text "Matiere was successfully created"
    click_on "Back"
  end

  test "updating a Matiere" do
    visit matieres_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @matiere.admin_id
    fill_in "Ecole", with: @matiere.ecole_id
    fill_in "Libelle", with: @matiere.libelle
    fill_in "User", with: @matiere.user_id
    click_on "Update Matiere"

    assert_text "Matiere was successfully updated"
    click_on "Back"
  end

  test "destroying a Matiere" do
    visit matieres_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Matiere was successfully destroyed"
  end
end
