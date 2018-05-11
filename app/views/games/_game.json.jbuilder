json.extract! game, :id, :name, :hp, :max_hp, :potion, :scrawl, :enemy_name, :enemy_hp, :created_at, :updated_at
json.url game_url(game, format: :json)
