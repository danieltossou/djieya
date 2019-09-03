require 'test_helper'

class SallesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salle = salles(:one)
  end

  test "should get index" do
    get salles_url
    assert_response :success
  end

  test "should get new" do
    get new_salle_url
    assert_response :success
  end

  test "should create salle" do
    assert_difference('Salle.count') do
      post salles_url, params: { salle: { admin_id: @salle.admin_id, ecole_id: @salle.ecole_id, libelle: @salle.libelle, user_id: @salle.user_id } }
    end

    assert_redirected_to salle_url(Salle.last)
  end

  test "should show salle" do
    get salle_url(@salle)
    assert_response :success
  end

  test "should get edit" do
    get edit_salle_url(@salle)
    assert_response :success
  end

  test "should update salle" do
    patch salle_url(@salle), params: { salle: { admin_id: @salle.admin_id, ecole_id: @salle.ecole_id, libelle: @salle.libelle, user_id: @salle.user_id } }
    assert_redirected_to salle_url(@salle)
  end

  test "should destroy salle" do
    assert_difference('Salle.count', -1) do
      delete salle_url(@salle)
    end

    assert_redirected_to salles_url
  end
end
