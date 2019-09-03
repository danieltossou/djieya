require "application_system_test_case"

class AnneesTest < ApplicationSystemTestCase
  setup do
    @annee = annees(:one)
  end

  test "visiting the index" do
    visit annees_url
    assert_selector "h1", text: "Annees"
  end

  test "creating a Annee" do
    visit annees_url
    click_on "New Annee"

    check "Etat" if @annee.etat
    fill_in "Libelle", with: @annee.libelle
    fill_in "User", with: @annee.user_id
    click_on "Create Annee"

    assert_text "Annee was successfully created"
    click_on "Back"
  end

  test "updating a Annee" do
    visit annees_url
    click_on "Edit", match: :first

    check "Etat" if @annee.etat
    fill_in "Libelle", with: @annee.libelle
    fill_in "User", with: @annee.user_id
    click_on "Update Annee"

    assert_text "Annee was successfully updated"
    click_on "Back"
  end

  test "destroying a Annee" do
    visit annees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Annee was successfully destroyed"
  end
end
