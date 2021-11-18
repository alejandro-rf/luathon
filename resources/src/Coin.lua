Actor = Actor or require "resources/lib/actor"
local Coin = Actor:extend()

local rotationSpeed = 0.5

function Coin:new(x,y)
  --Generate random spawn position
  local randomImage = love.math.random(1, 4)
  local randomSpawnPosX = love.math.random(0, 1280)
  local randomSpawnPosY = love.math.random(800, 900)
  self.delete = false
  
  Coin.super.new(self,"resources/textures/coin.png",randomSpawnPosX, randomSpawnPosY, 250, 0 , -1)
end

function Coin:update(dt)
    Coin.super.update(self,dt)
    --Check for borders
    self.delete = self:checkCollision()
    --Rotation
    self.rot = self.rot + rotationSpeed * dt
end

function Coin:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Coin:checkCollision()
  for _,v in ipairs(actorList) do
    if self.position.y < 0 - self.height then
      --store pos?
      return true
    end
  end
end

function Coin:resetPos()
  --Generate new position
	local randomXPos = love.math.random(0,800)
  local randomYPos = love.math.random(0,600)
  --Assign new position
  self.position.x = randomXPos
  self.position.y = randomYPos
end


return Coin
