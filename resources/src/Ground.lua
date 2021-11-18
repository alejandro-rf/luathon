Actor = Actor or require "resources/lib/actor"
local Ground = Actor:extend()

function Ground:new(x,y)
  self.delete = false
  
  Ground.super.new(self,"resources/textures/Ground.png",randomSpawnPosX, randomSpawnPosY, 50, 0 , -1)
end

function Ground:update(dt)
    Ground.super.update(self,dt)
    --Check for borders
    self:borderCollision()
    --Rotation
    self.rot = self.rot + rotationSpeed * dt
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

return Ground
