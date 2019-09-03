require "application_system_test_case"

class TimeTablesTest < ApplicationSystemTestCase
  setup do
    @time_table = time_tables(:one)
  end

  test "visiting the index" do
    visit time_tables_url
    assert_selector "h1", text: "Time Tables"
  end

  test "creating a Time table" do
    visit time_tables_url
    click_on "New Time Table"

    fill_in "Admin", with: @time_table.admin_id
    fill_in "Annee", with: @time_table.annee_id
    fill_in "Classe room", with: @time_table.classe_room_id
    fill_in "Creneau", with: @time_table.creneau_id
    fill_in "Ecole", with: @time_table.ecole_id
    fill_in "Enseignant", with: @time_table.enseignant_id
    fill_in "Jour", with: @time_table.jour_id
    fill_in "Matiere", with: @time_table.matiere_id
    fill_in "Nombre heure", with: @time_table.nombre_heure
    fill_in "Numero cours", with: @time_table.numero_cours
    fill_in "Numero cours g", with: @time_table.numero_cours_g
    fill_in "Salle", with: @time_table.salle_id
    fill_in "Semestre", with: @time_table.semestre_id
    fill_in "User", with: @time_table.user_id
    click_on "Create Time table"

    assert_text "Time table was successfully created"
    click_on "Back"
  end

  test "updating a Time table" do
    visit time_tables_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @time_table.admin_id
    fill_in "Annee", with: @time_table.annee_id
    fill_in "Classe room", with: @time_table.classe_room_id
    fill_in "Creneau", with: @time_table.creneau_id
    fill_in "Ecole", with: @time_table.ecole_id
    fill_in "Enseignant", with: @time_table.enseignant_id
    fill_in "Jour", with: @time_table.jour_id
    fill_in "Matiere", with: @time_table.matiere_id
    fill_in "Nombre heure", with: @time_table.nombre_heure
    fill_in "Numero cours", with: @time_table.numero_cours
    fill_in "Numero cours g", with: @time_table.numero_cours_g
    fill_in "Salle", with: @time_table.salle_id
    fill_in "Semestre", with: @time_table.semestre_id
    fill_in "User", with: @time_table.user_id
    click_on "Update Time table"

    assert_text "Time table was successfully updated"
    click_on "Back"
  end

  test "destroying a Time table" do
    visit time_tables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time table was successfully destroyed"
  end
end
