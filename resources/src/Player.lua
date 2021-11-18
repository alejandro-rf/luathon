Actor = Actor or require "resources/lib/actor" --¿Como voy a un path anterior al que ya estoy?
Player = Actor:extend()
local Vector = Vector or require"resources/lib/vector"

function Player:new(x,y)
  Player.super.new(self,"resources/textures/playerShip1_blue.png",400,300,50,0,0)
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
  --Go left
  if love.keyboard.isDown("a") then
    self.forward.x = -1
  end
  --Go right
  if love.keyboard.isDown("d") then
    self.forward.x = 1
  end
  
end


return Player