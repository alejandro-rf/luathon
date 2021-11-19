Actor = Actor or require "resources/lib/actor" --¿Como voy a un path anterior al que ya estoy?
Ghost = Actor:extend()
local Vector = Vector or require"resources/lib/vector"
BadCoin = BadCoin or require "resources/src/badcoin"
Anim8 = Anim8 or require "resources/lib/anim8"

function Ghost:new(x,y)
  Ghost.super.new(self,Data.PLAYER_GHOST_TEXTURE,x,400,300,0,0)
  self.Dead = false
  self.quadWidth = 129
  self.quadHeight = 184
  self.grid = Anim8.newGrid(self.quadWidth, self.quadHeight, self.image:getWidth(), self.image:getHeight())
  self.animation = Anim8.newAnimation(self.grid("1-6", 1), 0.2)
  self.grounded = false
  badCoinSound = love.audio.newSource("resources/sound/coinWrong.wav", "stream")
end

function Ghost:update(dt)
  --Ghost.handleInput(self, dt)
  --Ghost.super.update(self,dt)
  
  self.animation:update(dt)
  self:handleMovement(dt)
  self:checkCollision(dt)
end

function Ghost:draw()
  local xx = self.position.x
  --local ox = self.origin.x
  local yy = self.position.y
  --local oy = self.origin.y
  --local sx = self.scale.x
  --local sy = self.scale.y
  --local rr = self.rot
  --love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
  if not self.Dead then
    self.animation:draw(self.image, xx, yy, 0, 1, 1, self.quadWidth / 2, self.quadHeight / 2)
  end
end

function Ghost:handleInput(dt)
  --Go left
  if love.keyboard.isDown("a") then
    self.forward.x = -1
  end
  --Go right
  if love.keyboard.isDown("d") then
    self.forward.x = 1
  end
  
end

function Ghost:handleMovement(dt)
  if love.keyboard.isDown("d") then
    self.position.x = math.min(Data.SCREEN_WIDTH - self.width / 12, self.position.x + self.speed * dt)
  elseif love.keyboard.isDown("a") then
    self.position.x = math.max(self.width / 12, self.position.x - self.speed * dt)
  end
end

function Ghost:checkCollision(dt)
  for _,v in ipairs(actorList) do
    if v:is(BadCoin) then
      if self.position.x < v.position.x + v.width and self.position.x + self.quadWidth > v.position.x and self.position.y < v.position.y + v.height and self.height + self.position.y > v.position.y then
        v.delete = true
        playerScore = playerScore - 5
        badCoinSound:play()
      end
    end
  end
end

return Ghost