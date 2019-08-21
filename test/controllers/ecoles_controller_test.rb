require 'test_helper'

class EcolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ecole = ecoles(:one)
  end

  test "should get index" do
    get ecoles_url
    assert_response :success
  end

  test "should get new" do
    get new_ecole_url
    assert_response :success
  end

  test "should create ecole" do
    assert_difference('Ecole.count') do
      post ecoles_url, params: { ecole: { etat: @ecole.etat, libelle: @ecole.libelle, user_id: @ecole.user_id } }
    end

    assert_redirected_to ecole_url(Ecole.last)
  end

  test "should show ecole" do
    get ecole_url(@ecole)
    assert_response :success
  end

  test "should get edit" do
    get edit_ecole_url(@ecole)
    assert_response :success
  end

  test "should update ecole" do
    patch ecole_url(@ecole), params: { ecole: { etat: @ecole.etat, libelle: @ecole.libelle, user_id: @ecole.user_id } }
    assert_redirected_to ecole_url(@ecole)
  end

  test "should destroy ecole" do
    assert_difference('Ecole.count', -1) do
      delete ecole_url(@ecole)
    end

    assert_redirected_to ecoles_url
  end
end
