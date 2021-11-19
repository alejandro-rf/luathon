Actor = Actor or require "resources/lib/actor" --¿Como voy a un path anterior al que ya estoy?
Player = Actor:extend()
local Vector = Vector or require"resources/lib/vector"
BadCoin = BadCoin or require "resources/src/badcoin"

function Player:new(x,y)
  Player.super.new(self,Data.PLAYER_TEXTURE,400,300,250,0,0)
  self.Dead = false
end

function Player:update(dt)
  --Player.handleInput(self, dt)
  --Player.super.update(self,dt)
  self:handleMovement(dt)
  self:checkCollision(dt)
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

function Player:checkCollision(dt)
  for _,v in ipairs(actorList) do
    if v:is(Coin) or v:is(BadCoin) then
      if self.position.x < v.position.x + v.width and self.position.x + self.width > v.position.x and self.position.y < v.position.y + v.height and self.height + self.position.y > v.position.y then
        v.delete = true
      end
    end
    if v:is(Ground) and not self.Dead then
      self.position.y = self.position.y + self.speed * dt
      if self.position.x < v.position.x + v.width and self.position.x + self.width > v.position.x and self.position.y < v.position.y + v.height and self.height + self.position.y > v.position.y then
      end
    end
  end
end

function Player:Die()
  self.Dead = true
  table.insert(actorList, Timer(2, function() local coin = BadCoin(); table.insert(actorList, coin) end, true))
  table.insert(actorList, Timer(24, function() love.event.quit() end, false))
end


return Player