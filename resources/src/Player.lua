Actor = Actor or require "resources/lib/actor" --¿Como voy a un path anterior al que ya estoy?
Player = Actor:extend()
local Vector = Vector or require"resources/lib/vector"

function Player:new(x,y)
  Player.super.new(self,"Textures/playerPlayer1_blue.png",400,300,50,1,0)
end

function Player:update(dt)
  Player.handleInput(self, dt)
  Player.super.update(self,dt)
end

function Player:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Player:handleInput(dt)
  --Forward
  if love.keyboard.isDown("w") then
    self.speed = self.speed + 50 * dt
  end
  --Backward
  if love.keyboard.isDown("s") then
    self.speed = self.speed - 50 * dt
  end
  --Turn left
  if love.keyboard.isDown("a") then
    self.forward:rotate(-2.5 * dt)
    --self.forward:normalize()
    self.rot = self.forward:ang()
  end
  --Turn right
  if love.keyboard.isDown("d") then
    self.forward:rotate(2.5 * dt)
    --self.forward:normalize()
    self.rot = self.forward:ang()
  end
  
end


return Player