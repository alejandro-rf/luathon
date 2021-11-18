Actor = Actor or require "resources/lib/actor"
local Ground = Actor:extend()

function Ground:new(x,y)
  self.delete = false
  
  Ground.super.new(self,"resources/textures/ground.png",Data.SCREEN_WIDTH / 2, Data.SCREEN_HEIGHT + 100, 50, 0 , -1)
end

function Ground:update(dt)
    Ground.super.update(self, dt)
    self:stopAtCertainPos()
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

return Ground
