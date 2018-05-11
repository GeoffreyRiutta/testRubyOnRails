require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should get new" do
    get new_game_url
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post games_url, params: { game: { enemy_hp: @game.enemy_hp, enemy_name: @game.enemy_name, hp: @game.hp, max_hp: @game.max_hp, name: @game.name, potion: @game.potion, scrawl: @game.scrawl } }
    end

    assert_redirected_to game_url(Game.last)
  end

  test "should show game" do
    get game_url(@game)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_url(@game)
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { enemy_hp: @game.enemy_hp, enemy_name: @game.enemy_name, hp: @game.hp, max_hp: @game.max_hp, name: @game.name, potion: @game.potion, scrawl: @game.scrawl } }
    assert_redirected_to game_url(@game)
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete game_url(@game)
    end

    assert_redirected_to games_url
  end
end
