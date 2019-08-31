require 'test_helper'

class JoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jour = jours(:one)
  end

  test "should get index" do
    get jours_url
    assert_response :success
  end

  test "should get new" do
    get new_jour_url
    assert_response :success
  end

  test "should create jour" do
    assert_difference('Jour.count') do
      post jours_url, params: { jour: { admin_id: @jour.admin_id, ecole_id: @jour.ecole_id, libelle: @jour.libelle, user_id: @jour.user_id } }
    end

    assert_redirected_to jour_url(Jour.last)
  end

  test "should show jour" do
    get jour_url(@jour)
    assert_response :success
  end

  test "should get edit" do
    get edit_jour_url(@jour)
    assert_response :success
  end

  test "should update jour" do
    patch jour_url(@jour), params: { jour: { admin_id: @jour.admin_id, ecole_id: @jour.ecole_id, libelle: @jour.libelle, user_id: @jour.user_id } }
    assert_redirected_to jour_url(@jour)
  end

  test "should destroy jour" do
    assert_difference('Jour.count', -1) do
      delete jour_url(@jour)
    end

    assert_redirected_to jours_url
  end
end
