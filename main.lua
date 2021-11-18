Player = Player or require "resources/src/player"
Coin = Coin or require "resources/src/coin"

actorList = {}  --Lista de elementos de juego

function love.load()
  local p = Player()
  table.insert(actorList,p)
  local c = Coin()
  table.insert(actorList,c)
end

function love.update(dt)
  for _,v in ipairs(actorList) do
    if CheckIfDead(v) then
      table.remove(actorList, _)
    end
    v:update(dt)
  end
end

function love.draw()
  for _,v in ipairs(actorList) do
    v:draw()
  end
end

function CheckIfDead(object)
  if object:is(Coin) and object.delete then
    return true
  end
end

