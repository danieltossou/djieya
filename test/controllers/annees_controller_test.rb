require 'test_helper'

class AnneesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @annee = annees(:one)
  end

  test "should get index" do
    get annees_url
    assert_response :success
  end

  test "should get new" do
    get new_annee_url
    assert_response :success
  end

  test "should create annee" do
    assert_difference('Annee.count') do
      post annees_url, params: { annee: { etat: @annee.etat, libelle: @annee.libelle, user_id: @annee.user_id } }
    end

    assert_redirected_to annee_url(Annee.last)
  end

  test "should show annee" do
    get annee_url(@annee)
    assert_response :success
  end

  test "should get edit" do
    get edit_annee_url(@annee)
    assert_response :success
  end

  test "should update annee" do
    patch annee_url(@annee), params: { annee: { etat: @annee.etat, libelle: @annee.libelle, user_id: @annee.user_id } }
    assert_redirected_to annee_url(@annee)
  end

  test "should destroy annee" do
    assert_difference('Annee.count', -1) do
      delete annee_url(@annee)
    end

    assert_redirected_to annees_url
  end
end
