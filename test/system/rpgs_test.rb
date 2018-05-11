require "application_system_test_case"

class RpgsTest < ApplicationSystemTestCase
  setup do
    @rpg = rpgs(:one)
  end

  test "visiting the index" do
    visit rpgs_url
    assert_selector "h1", text: "Rpgs"
  end

  test "creating a Rpg" do
    visit rpgs_url
    click_on "New Rpg"

    fill_in "Enemy Hp", with: @rpg.enemy_hp
    fill_in "Enemy Name", with: @rpg.enemy_name
    fill_in "Hp", with: @rpg.hp
    fill_in "Max Hp", with: @rpg.max_hp
    fill_in "Name", with: @rpg.name
    fill_in "Potion", with: @rpg.potion
    fill_in "Scrawl", with: @rpg.scrawl
    click_on "Create Rpg"

    assert_text "Rpg was successfully created"
    click_on "Back"
  end

  test "updating a Rpg" do
    visit rpgs_url
    click_on "Edit", match: :first

    fill_in "Enemy Hp", with: @rpg.enemy_hp
    fill_in "Enemy Name", with: @rpg.enemy_name
    fill_in "Hp", with: @rpg.hp
    fill_in "Max Hp", with: @rpg.max_hp
    fill_in "Name", with: @rpg.name
    fill_in "Potion", with: @rpg.potion
    fill_in "Scrawl", with: @rpg.scrawl
    click_on "Update Rpg"

    assert_text "Rpg was successfully updated"
    click_on "Back"
  end

  test "destroying a Rpg" do
    visit rpgs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rpg was successfully destroyed"
  end
end
