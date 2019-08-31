require 'test_helper'

class MatieresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matiere = matieres(:one)
  end

  test "should get index" do
    get matieres_url
    assert_response :success
  end

  test "should get new" do
    get new_matiere_url
    assert_response :success
  end

  test "should create matiere" do
    assert_difference('Matiere.count') do
      post matieres_url, params: { matiere: { admin_id: @matiere.admin_id, ecole_id: @matiere.ecole_id, libelle: @matiere.libelle, user_id: @matiere.user_id } }
    end

    assert_redirected_to matiere_url(Matiere.last)
  end

  test "should show matiere" do
    get matiere_url(@matiere)
    assert_response :success
  end

  test "should get edit" do
    get edit_matiere_url(@matiere)
    assert_response :success
  end

  test "should update matiere" do
    patch matiere_url(@matiere), params: { matiere: { admin_id: @matiere.admin_id, ecole_id: @matiere.ecole_id, libelle: @matiere.libelle, user_id: @matiere.user_id } }
    assert_redirected_to matiere_url(@matiere)
  end

  test "should destroy matiere" do
    assert_difference('Matiere.count', -1) do
      delete matiere_url(@matiere)
    end

    assert_redirected_to matieres_url
  end
end
