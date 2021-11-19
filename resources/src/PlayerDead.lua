Actor = Actor or require "resources/lib/actor" --¿Como voy a un path anterior al que ya estoy?
PlayerDead = Actor:extend()
local Vector = Vector or require"resources/lib/vector"
BadCoin = BadCoin or require "resources/src/badcoin"
Anim8 = Anim8 or require "resources/lib/anim8"

function PlayerDead:new(x,y)
  PlayerDead.super.new(self,Data.PLAYER_DEAD_TEXTURE,1280/2,720/2,250,0,0)
end

function PlayerDead:update(dt)
    for _,v in ipairs(actorList) do
        if v:is(Ground) then
            self.position.y = v.position.y - v.height
        end
    end
end

function PlayerDead:draw()
  local xx = self.position.x
  local yy = self.position.y
  love.graphics.draw(self.image, self.position.x, self.position.y)
end

return PlayerDead