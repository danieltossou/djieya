require 'test_helper'

class SemestresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @semestre = semestres(:one)
  end

  test "should get index" do
    get semestres_url
    assert_response :success
  end

  test "should get new" do
    get new_semestre_url
    assert_response :success
  end

  test "should create semestre" do
    assert_difference('Semestre.count') do
      post semestres_url, params: { semestre: { admin_id: @semestre.admin_id, libelle: @semestre.libelle, user_id: @semestre.user_id } }
    end

    assert_redirected_to semestre_url(Semestre.last)
  end

  test "should show semestre" do
    get semestre_url(@semestre)
    assert_response :success
  end

  test "should get edit" do
    get edit_semestre_url(@semestre)
    assert_response :success
  end

  test "should update semestre" do
    patch semestre_url(@semestre), params: { semestre: { admin_id: @semestre.admin_id, libelle: @semestre.libelle, user_id: @semestre.user_id } }
    assert_redirected_to semestre_url(@semestre)
  end

  test "should destroy semestre" do
    assert_difference('Semestre.count', -1) do
      delete semestre_url(@semestre)
    end

    assert_redirected_to semestres_url
  end
end
