require 'test_helper'

class InscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inscription = inscriptions(:one)
  end

  test "should get index" do
    get inscriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_inscription_url
    assert_response :success
  end

  test "should create inscription" do
    assert_difference('Inscription.count') do
      post inscriptions_url, params: { inscription: { annee_id: @inscription.annee_id, classe_room_id: @inscription.classe_room_id, ecole_id: @inscription.ecole_id, etudiant_id: @inscription.etudiant_id, montant: @inscription.montant, user_id: @inscription.user_id } }
    end

    assert_redirected_to inscription_url(Inscription.last)
  end

  test "should show inscription" do
    get inscription_url(@inscription)
    assert_response :success
  end

  test "should get edit" do
    get edit_inscription_url(@inscription)
    assert_response :success
  end

  test "should update inscription" do
    patch inscription_url(@inscription), params: { inscription: { annee_id: @inscription.annee_id, classe_room_id: @inscription.classe_room_id, ecole_id: @inscription.ecole_id, etudiant_id: @inscription.etudiant_id, montant: @inscription.montant, user_id: @inscription.user_id } }
    assert_redirected_to inscription_url(@inscription)
  end

  test "should destroy inscription" do
    assert_difference('Inscription.count', -1) do
      delete inscription_url(@inscription)
    end

    assert_redirected_to inscriptions_url
  end
end
