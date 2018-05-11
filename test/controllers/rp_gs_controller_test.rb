require 'test_helper'

class RpGsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rpg = rpgs(:one)
  end

  test "should get index" do
    get rpgs_url
    assert_response :success
  end

  test "should get new" do
    get new_rpg_url
    assert_response :success
  end

  test "should create rpg" do
    assert_difference('Rpg.count') do
      post rpgs_url, params: { rpg: { enemy_hp: @rpg.enemy_hp, enemy_name: @rpg.enemy_name, hp: @rpg.hp, max_hp: @rpg.max_hp, name: @rpg.name, potion: @rpg.potion, scrawl: @rpg.scrawl } }
    end

    assert_redirected_to rpg_url(Rpg.last)
  end

  test "should show rpg" do
    get rpg_url(@rpg)
    assert_response :success
  end

  test "should get edit" do
    get edit_rpg_url(@rpg)
    assert_response :success
  end

  test "should update rpg" do
    patch rpg_url(@rpg), params: { rpg: { enemy_hp: @rpg.enemy_hp, enemy_name: @rpg.enemy_name, hp: @rpg.hp, max_hp: @rpg.max_hp, name: @rpg.name, potion: @rpg.potion, scrawl: @rpg.scrawl } }
    assert_redirected_to rpg_url(@rpg)
  end

  test "should destroy rpg" do
    assert_difference('Rpg.count', -1) do
      delete rpg_url(@rpg)
    end

    assert_redirected_to rpgs_url
  end
end
