require "application_system_test_case"

class DroitsTest < ApplicationSystemTestCase
  setup do
    @droit = droits(:one)
  end

  test "visiting the index" do
    visit droits_url
    assert_selector "h1", text: "Droits"
  end

  test "creating a Droit" do
    visit droits_url
    click_on "New Droit"

    fill_in "Admin", with: @droit.admin_id
    check "Annee" if @droit.annee
    check "Caisse" if @droit.caisse
    check "Classe" if @droit.classe
    check "Dossier" if @droit.dossier
    fill_in "Emploi temps", with: @droit.emploi_temps
    check "Enseignant" if @droit.enseignant
    check "Etudiant" if @droit.etudiant
    check "Matiere" if @droit.matiere
    check "Salle" if @droit.salle
    check "Semestre" if @droit.semestre
    check "Tableau board" if @droit.tableau_board
    fill_in "User", with: @droit.user_id
    check "Utilisateur" if @droit.utilisateur
    check "Versement" if @droit.versement
    click_on "Create Droit"

    assert_text "Droit was successfully created"
    click_on "Back"
  end

  test "updating a Droit" do
    visit droits_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @droit.admin_id
    check "Annee" if @droit.annee
    check "Caisse" if @droit.caisse
    check "Classe" if @droit.classe
    check "Dossier" if @droit.dossier
    fill_in "Emploi temps", with: @droit.emploi_temps
    check "Enseignant" if @droit.enseignant
    check "Etudiant" if @droit.etudiant
    check "Matiere" if @droit.matiere
    check "Salle" if @droit.salle
    check "Semestre" if @droit.semestre
    check "Tableau board" if @droit.tableau_board
    fill_in "User", with: @droit.user_id
    check "Utilisateur" if @droit.utilisateur
    check "Versement" if @droit.versement
    click_on "Update Droit"

    assert_text "Droit was successfully updated"
    click_on "Back"
  end

  test "destroying a Droit" do
    visit droits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Droit was successfully destroyed"
  end
end
