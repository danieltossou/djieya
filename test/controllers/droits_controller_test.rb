require 'test_helper'

class DroitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @droit = droits(:one)
  end

  test "should get index" do
    get droits_url
    assert_response :success
  end

  test "should get new" do
    get new_droit_url
    assert_response :success
  end

  test "should create droit" do
    assert_difference('Droit.count') do
      post droits_url, params: { droit: { admin_id: @droit.admin_id, annee: @droit.annee, caisse: @droit.caisse, classe: @droit.classe, dossier: @droit.dossier, emploi_temps: @droit.emploi_temps, enseignant: @droit.enseignant, etudiant: @droit.etudiant, matiere: @droit.matiere, salle: @droit.salle, semestre: @droit.semestre, tableau_board: @droit.tableau_board, user_id: @droit.user_id, utilisateur: @droit.utilisateur, versement: @droit.versement } }
    end

    assert_redirected_to droit_url(Droit.last)
  end

  test "should show droit" do
    get droit_url(@droit)
    assert_response :success
  end

  test "should get edit" do
    get edit_droit_url(@droit)
    assert_response :success
  end

  test "should update droit" do
    patch droit_url(@droit), params: { droit: { admin_id: @droit.admin_id, annee: @droit.annee, caisse: @droit.caisse, classe: @droit.classe, dossier: @droit.dossier, emploi_temps: @droit.emploi_temps, enseignant: @droit.enseignant, etudiant: @droit.etudiant, matiere: @droit.matiere, salle: @droit.salle, semestre: @droit.semestre, tableau_board: @droit.tableau_board, user_id: @droit.user_id, utilisateur: @droit.utilisateur, versement: @droit.versement } }
    assert_redirected_to droit_url(@droit)
  end

  test "should destroy droit" do
    assert_difference('Droit.count', -1) do
      delete droit_url(@droit)
    end

    assert_redirected_to droits_url
  end
end
