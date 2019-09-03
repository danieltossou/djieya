require 'test_helper'

class ClasseRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classe_room = classe_rooms(:one)
  end

  test "should get index" do
    get classe_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_classe_room_url
    assert_response :success
  end

  test "should create classe_room" do
    assert_difference('ClasseRoom.count') do
      post classe_rooms_url, params: { classe_room: { ecole_id: @classe_room.ecole_id, etat: @classe_room.etat, libelle: @classe_room.libelle, montant: @classe_room.montant, user_id: @classe_room.user_id } }
    end

    assert_redirected_to classe_room_url(ClasseRoom.last)
  end

  test "should show classe_room" do
    get classe_room_url(@classe_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_classe_room_url(@classe_room)
    assert_response :success
  end

  test "should update classe_room" do
    patch classe_room_url(@classe_room), params: { classe_room: { ecole_id: @classe_room.ecole_id, etat: @classe_room.etat, libelle: @classe_room.libelle, montant: @classe_room.montant, user_id: @classe_room.user_id } }
    assert_redirected_to classe_room_url(@classe_room)
  end

  test "should destroy classe_room" do
    assert_difference('ClasseRoom.count', -1) do
      delete classe_room_url(@classe_room)
    end

    assert_redirected_to classe_rooms_url
  end
end
