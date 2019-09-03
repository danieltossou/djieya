require 'test_helper'

class EtudiantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @etudiant = etudiants(:one)
  end

  test "should get index" do
    get etudiants_url
    assert_response :success
  end

  test "should get new" do
    get new_etudiant_url
    assert_response :success
  end

  test "should create etudiant" do
    assert_difference('Etudiant.count') do
      post etudiants_url, params: { etudiant: { adresse: @etudiant.adresse, autre: @etudiant.autre, classe_room_id: @etudiant.classe_room_id, contact: @etudiant.contact, contact_parent: @etudiant.contact_parent, date_naissance: @etudiant.date_naissance, ecole_id: @etudiant.ecole_id, email: @etudiant.email, email_parent: @etudiant.email_parent, lien_parente: @etudiant.lien_parente, maladie: @etudiant.maladie, matricule: @etudiant.matricule, nationnalite: @etudiant.nationnalite, nom: @etudiant.nom, nom_parent: @etudiant.nom_parent, num_inscription: @etudiant.num_inscription, oriente: @etudiant.oriente, photo: @etudiant.photo, prenom: @etudiant.prenom, sexe: @etudiant.sexe } }
    end

    assert_redirected_to etudiant_url(Etudiant.last)
  end

  test "should show etudiant" do
    get etudiant_url(@etudiant)
    assert_response :success
  end

  test "should get edit" do
    get edit_etudiant_url(@etudiant)
    assert_response :success
  end

  test "should update etudiant" do
    patch etudiant_url(@etudiant), params: { etudiant: { adresse: @etudiant.adresse, autre: @etudiant.autre, classe_room_id: @etudiant.classe_room_id, contact: @etudiant.contact, contact_parent: @etudiant.contact_parent, date_naissance: @etudiant.date_naissance, ecole_id: @etudiant.ecole_id, email: @etudiant.email, email_parent: @etudiant.email_parent, lien_parente: @etudiant.lien_parente, maladie: @etudiant.maladie, matricule: @etudiant.matricule, nationnalite: @etudiant.nationnalite, nom: @etudiant.nom, nom_parent: @etudiant.nom_parent, num_inscription: @etudiant.num_inscription, oriente: @etudiant.oriente, photo: @etudiant.photo, prenom: @etudiant.prenom, sexe: @etudiant.sexe } }
    assert_redirected_to etudiant_url(@etudiant)
  end

  test "should destroy etudiant" do
    assert_difference('Etudiant.count', -1) do
      delete etudiant_url(@etudiant)
    end

    assert_redirected_to etudiants_url
  end
end
