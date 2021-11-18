Actor = Actor or require "resources/lib/actor" --¿Como voy a un path anterior al que ya estoy?
Player = Actor:extend()
local Vector = Vector or require"resources/lib/vector"

function Player:new(x,y)
  Player.super.new(self,Data.PLAYER_TEXTURE,400,300,250,0,0)
end

function Player:update(dt)
  --Player.handleInput(self, dt)
  --Player.super.update(self,dt)
  self:handleMovement(dt)
  self:checkCollision()
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

function Player:handleMovement(dt)
  if love.keyboard.isDown("d") then
    self.position.x = math.min(Data.SCREEN_WIDTH - self.width / 2, self.position.x + self.speed * dt)
  elseif love.keyboard.isDown("a") then
    self.position.x = math.max(self.width / 2, self.position.x - self.speed * dt)
  end
end

function Player:checkCollision()
  for _,v in ipairs(actorList) do
    if v:is(Coin)then
      if self.position.x < v.position.x + v.width and self.position.x + self.width > v.position.x and self.position.y < v.position.y + v.height and self.height + self.position.y > v.position.y then
        v.delete = true
      end
    end
  end
end


return Player