local data = {}
-- screen-related variables
data.SCREEN_WIDTH, data.SCREEN_HEIGHT = love.graphics.getDimensions()

-- player-related variables
data.PLAYER_TEXTURE = "resources/textures/playerShip1_blue.png"
data.COIN_TEXTURE = "resources/textures/coin.png"
data.BAD_COIN_TEXTURE = "resources/textures/badCoin.png"

return data