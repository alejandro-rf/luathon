Actor = Actor or require "Scripts/actor"
Ship = Actor:extend()
local Vector = Vector or require"Scripts/vector"

function Ship:new(x,y)
  Ship.super.new(self,"Textures/playerShip1_blue.png",400,300,50,1,0)
end

function Ship:update(dt)
  Ship.handleInput(self, dt)
  Ship.super.update(self,dt)
end

function Ship:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

--Using SPACE instead of A to create asteroids because A is already being used for ship controls
function Ship:keyPressed(key)
  if key == "space" then
    --Create asteroid
    local a = Asteroid()
    table.insert(actorList,a)
  end
end

function Ship:handleInput(dt)
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


return Ship