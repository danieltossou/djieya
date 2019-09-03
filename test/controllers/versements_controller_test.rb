require 'test_helper'

class VersementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @versement = versements(:one)
  end

  test "should get index" do
    get versements_url
    assert_response :success
  end

  test "should get new" do
    get new_versement_url
    assert_response :success
  end

  test "should create versement" do
    assert_difference('Versement.count') do
      post versements_url, params: { versement: { annee_id: @versement.annee_id, ecole_id: @versement.ecole_id, etudiant_id: @versement.etudiant_id, montant: @versement.montant, user_id: @versement.user_id } }
    end

    assert_redirected_to versement_url(Versement.last)
  end

  test "should show versement" do
    get versement_url(@versement)
    assert_response :success
  end

  test "should get edit" do
    get edit_versement_url(@versement)
    assert_response :success
  end

  test "should update versement" do
    patch versement_url(@versement), params: { versement: { annee_id: @versement.annee_id, ecole_id: @versement.ecole_id, etudiant_id: @versement.etudiant_id, montant: @versement.montant, user_id: @versement.user_id } }
    assert_redirected_to versement_url(@versement)
  end

  test "should destroy versement" do
    assert_difference('Versement.count', -1) do
      delete versement_url(@versement)
    end

    assert_redirected_to versements_url
  end
end
