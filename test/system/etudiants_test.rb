require "application_system_test_case"

class EtudiantsTest < ApplicationSystemTestCase
  setup do
    @etudiant = etudiants(:one)
  end

  test "visiting the index" do
    visit etudiants_url
    assert_selector "h1", text: "Etudiants"
  end

  test "creating a Etudiant" do
    visit etudiants_url
    click_on "New Etudiant"

    fill_in "Adresse", with: @etudiant.adresse
    fill_in "Autre", with: @etudiant.autre
    fill_in "Classe room", with: @etudiant.classe_room_id
    fill_in "Contact", with: @etudiant.contact
    fill_in "Contact parent", with: @etudiant.contact_parent
    fill_in "Date naissance", with: @etudiant.date_naissance
    fill_in "Ecole", with: @etudiant.ecole_id
    fill_in "Email", with: @etudiant.email
    fill_in "Email parent", with: @etudiant.email_parent
    fill_in "Lien parente", with: @etudiant.lien_parente
    fill_in "Maladie", with: @etudiant.maladie
    fill_in "Matricule", with: @etudiant.matricule
    fill_in "Nationnalite", with: @etudiant.nationnalite
    fill_in "Nom", with: @etudiant.nom
    fill_in "Nom parent", with: @etudiant.nom_parent
    fill_in "Num inscription", with: @etudiant.num_inscription
    check "Oriente" if @etudiant.oriente
    fill_in "Photo", with: @etudiant.photo
    fill_in "Prenom", with: @etudiant.prenom
    check "Sexe" if @etudiant.sexe
    click_on "Create Etudiant"

    assert_text "Etudiant was successfully created"
    click_on "Back"
  end

  test "updating a Etudiant" do
    visit etudiants_url
    click_on "Edit", match: :first

    fill_in "Adresse", with: @etudiant.adresse
    fill_in "Autre", with: @etudiant.autre
    fill_in "Classe room", with: @etudiant.classe_room_id
    fill_in "Contact", with: @etudiant.contact
    fill_in "Contact parent", with: @etudiant.contact_parent
    fill_in "Date naissance", with: @etudiant.date_naissance
    fill_in "Ecole", with: @etudiant.ecole_id
    fill_in "Email", with: @etudiant.email
    fill_in "Email parent", with: @etudiant.email_parent
    fill_in "Lien parente", with: @etudiant.lien_parente
    fill_in "Maladie", with: @etudiant.maladie
    fill_in "Matricule", with: @etudiant.matricule
    fill_in "Nationnalite", with: @etudiant.nationnalite
    fill_in "Nom", with: @etudiant.nom
    fill_in "Nom parent", with: @etudiant.nom_parent
    fill_in "Num inscription", with: @etudiant.num_inscription
    check "Oriente" if @etudiant.oriente
    fill_in "Photo", with: @etudiant.photo
    fill_in "Prenom", with: @etudiant.prenom
    check "Sexe" if @etudiant.sexe
    click_on "Update Etudiant"

    assert_text "Etudiant was successfully updated"
    click_on "Back"
  end

  test "destroying a Etudiant" do
    visit etudiants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Etudiant was successfully destroyed"
  end
end
