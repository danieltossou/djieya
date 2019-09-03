require 'test_helper'

class TimeTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_table = time_tables(:one)
  end

  test "should get index" do
    get time_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_time_table_url
    assert_response :success
  end

  test "should create time_table" do
    assert_difference('TimeTable.count') do
      post time_tables_url, params: { time_table: { admin_id: @time_table.admin_id, annee_id: @time_table.annee_id, classe_room_id: @time_table.classe_room_id, creneau_id: @time_table.creneau_id, ecole_id: @time_table.ecole_id, enseignant_id: @time_table.enseignant_id, jour_id: @time_table.jour_id, matiere_id: @time_table.matiere_id, nombre_heure: @time_table.nombre_heure, numero_cours: @time_table.numero_cours, numero_cours_g: @time_table.numero_cours_g, salle_id: @time_table.salle_id, semestre_id: @time_table.semestre_id, user_id: @time_table.user_id } }
    end

    assert_redirected_to time_table_url(TimeTable.last)
  end

  test "should show time_table" do
    get time_table_url(@time_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_table_url(@time_table)
    assert_response :success
  end

  test "should update time_table" do
    patch time_table_url(@time_table), params: { time_table: { admin_id: @time_table.admin_id, annee_id: @time_table.annee_id, classe_room_id: @time_table.classe_room_id, creneau_id: @time_table.creneau_id, ecole_id: @time_table.ecole_id, enseignant_id: @time_table.enseignant_id, jour_id: @time_table.jour_id, matiere_id: @time_table.matiere_id, nombre_heure: @time_table.nombre_heure, numero_cours: @time_table.numero_cours, numero_cours_g: @time_table.numero_cours_g, salle_id: @time_table.salle_id, semestre_id: @time_table.semestre_id, user_id: @time_table.user_id } }
    assert_redirected_to time_table_url(@time_table)
  end

  test "should destroy time_table" do
    assert_difference('TimeTable.count', -1) do
      delete time_table_url(@time_table)
    end

    assert_redirected_to time_tables_url
  end
end
