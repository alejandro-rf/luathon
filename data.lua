local data = {}
-- screen-related variables
data.SCREEN_WIDTH, data.SCREEN_HEIGHT = love.graphics.getDimensions()

-- player-related variables
data.PLAYER_TEXTURE = "resources/textures/animatedPlayer.png"
data.PLAYER_DEAD_TEXTURE = "resources/textures/playerDead.png"
data.PLAYER_GHOST_TEXTURE = "resources/textures/spriteAnimateGhost.png"
data.COIN_TEXTURE = "resources/textures/coin.png"
data.BAD_COIN_TEXTURE = "resources/textures/badCoin.png"

return data