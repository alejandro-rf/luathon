Player = Player or require "resources/src/player"
Coin = Coin or require "resources/src/coin"
Timer = Timer or require "resources/lib/timer"

actorList = {}  --Lista de elementos de juego

function love.load()
  local p = Player()
  table.insert(actorList,p)
  table.insert(actorList, Timer(2, function() local coin = Coin(); table.insert(actorList, coin) end, true))
end

function love.update(dt)
  for _,v in ipairs(actorList) do
    if checkIfDead(v) then
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

function checkIfDead(object)
  if object:is(Coin) and object.delete then
    return true
  end
end

