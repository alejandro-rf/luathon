Actor = Actor or require "resources/lib/actor"
local Ground = Actor:extend()

function Ground:new(x,y)
  local playerIsDead = false
  self.delete = false 
  Ground.super.new(self,"resources/textures/ground.png",Data.SCREEN_WIDTH / 2, Data.SCREEN_HEIGHT + 100, 700, 0 , -1)
end

function Ground:update(dt)
    Ground.super.update(self, dt)
    self:stopAtCertainPos()
    self:checkCollision()
end

function Ground:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Ground:stopAtCertainPos()
    if self.position.y <= Data.SCREEN_HEIGHT - self.height then
        self.speed = 0
    end
end

function Ground:checkCollision(dt)
  for _,v in ipairs(actorList) do
    if v:is(Player)then
      if self.position.y < v.position.y + v.height and self.height + self.position.y > v.position.y then
        v.Dead = true
        playerIsDead = true
        table.insert(actorList, Timer(2, function() self.forward.y = 1; self.speed = 300 end, false))
      end
    end
  end
end

return Ground
