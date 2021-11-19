Actor = Actor or require "resources/lib/actor"
local Ground = Actor:extend()

function Ground:new(x,y)
  local playerIsDead = false
  local timer = false
  self.delete = false 
  Ground.super.new(self,"resources/textures/ground.png",Data.SCREEN_WIDTH / 2, Data.SCREEN_HEIGHT + 100, 700, 0 , -1)
  crackSound = love.audio.newSource("resources/sound/crackSound.wav", "stream")
end

function Ground:update(dt)
    Ground.super.update(self, dt)
    self:stopAtCertainPosition()
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

function Ground:stopAtCertainPosition()
    if self.position.y <= Data.SCREEN_HEIGHT - self.height then
        self.speed = 0
    elseif playerIsDead and self.position.y > Data.SCREEN_HEIGHT + self.height then
      self.delete = true
    end
end

function Ground:checkCollision(dt)
  for _,v in ipairs(actorList) do
    if v:is(Player) and v.Dead == false then
      if self.position.y < v.position.y + v.height and self.height + self.position.y > v.position.y then
        --Clean up
        crackSound:play()

        for _,v in ipairs(actorList) do
          if v:is(Timer) then
            v.delete = true
          end
        end
        v:Die()
        playerIsDead = true
        if not timer then
          table.insert(actorList, Timer(4, function() self.forward.y = 1; self.speed = 300; v.grounded = false end, true))
          timer = true
        end
      end
    end
  end
end

return Ground
