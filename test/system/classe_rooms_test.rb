require "application_system_test_case"

class ClasseRoomsTest < ApplicationSystemTestCase
  setup do
    @classe_room = classe_rooms(:one)
  end

  test "visiting the index" do
    visit classe_rooms_url
    assert_selector "h1", text: "Classe Rooms"
  end

  test "creating a Classe room" do
    visit classe_rooms_url
    click_on "New Classe Room"

    fill_in "Ecole", with: @classe_room.ecole_id
    check "Etat" if @classe_room.etat
    fill_in "Libelle", with: @classe_room.libelle
    fill_in "Montant", with: @classe_room.montant
    fill_in "User", with: @classe_room.user_id
    click_on "Create Classe room"

    assert_text "Classe room was successfully created"
    click_on "Back"
  end

  test "updating a Classe room" do
    visit classe_rooms_url
    click_on "Edit", match: :first

    fill_in "Ecole", with: @classe_room.ecole_id
    check "Etat" if @classe_room.etat
    fill_in "Libelle", with: @classe_room.libelle
    fill_in "Montant", with: @classe_room.montant
    fill_in "User", with: @classe_room.user_id
    click_on "Update Classe room"

    assert_text "Classe room was successfully updated"
    click_on "Back"
  end

  test "destroying a Classe room" do
    visit classe_rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Classe room was successfully destroyed"
  end
end
