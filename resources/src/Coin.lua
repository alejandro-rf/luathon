Actor = Actor or require "Scripts/actor"
local Coin = Actor:extend()

local rSpeed = 0.5

function Coin:new(x,y)
  --Generate random attributes
  local randomImage = love.math.random(1, 4)
  local randomSpawnPosX = love.math.random(0, 800)
  local randomSpawnPosY = love.math.random(0, 600)
  local randomForwardX = love.math.random(-1, 1)
  local randomForwardY = love.math.random(-1, 1)
  local randomSpeed = love.math.random(30, 50)
  
  Coin.super.new(self,"Textures/Meteors/meteorBrown_big"..tostring(randomImage)..".png",randomSpawnPosX, randomSpawnPosY, randomSpeed, randomForwardX ,randomForwardY)
end

function Coin:update(dt)
    Coin.super.update(self,dt)
    --Check for borders
    self:borderCollision()
    --Rotation
    self.rot = self.rot + rSpeed * dt
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

function Coin:borderCollision()
  if self.position.x < 0 - self.width or self.position.x > 800 + self.width or self.position.y < 0 - self.height or self.position.y > 600 + self.height then
    self:resetPos()
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
