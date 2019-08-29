require 'test_helper'

class DisponibilitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @disponibilite = disponibilites(:one)
  end

  test "should get index" do
    get disponibilites_url
    assert_response :success
  end

  test "should get new" do
    get new_disponibilite_url
    assert_response :success
  end

  test "should create disponibilite" do
    assert_difference('Disponibilite.count') do
      post disponibilites_url, params: { disponibilite: { admin_id: @disponibilite.admin_id, creneau_id: @disponibilite.creneau_id, ecole_id: @disponibilite.ecole_id, enseignant_id: @disponibilite.enseignant_id, jour_id: @disponibilite.jour_id, user_id: @disponibilite.user_id } }
    end

    assert_redirected_to disponibilite_url(Disponibilite.last)
  end

  test "should show disponibilite" do
    get disponibilite_url(@disponibilite)
    assert_response :success
  end

  test "should get edit" do
    get edit_disponibilite_url(@disponibilite)
    assert_response :success
  end

  test "should update disponibilite" do
    patch disponibilite_url(@disponibilite), params: { disponibilite: { admin_id: @disponibilite.admin_id, creneau_id: @disponibilite.creneau_id, ecole_id: @disponibilite.ecole_id, enseignant_id: @disponibilite.enseignant_id, jour_id: @disponibilite.jour_id, user_id: @disponibilite.user_id } }
    assert_redirected_to disponibilite_url(@disponibilite)
  end

  test "should destroy disponibilite" do
    assert_difference('Disponibilite.count', -1) do
      delete disponibilite_url(@disponibilite)
    end

    assert_redirected_to disponibilites_url
  end
end
