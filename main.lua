Player = Player or require "resources/src/player"
Coin = Coin or require "resources/src/coin"
Timer = Timer or require "resources/lib/timer"
Ground = Ground or require "resources/src/Ground"
Data = Data or require "data"

actorList = {}  --Lista de elementos de juego

function love.load()
  local p = Player()
  local g = Ground()
  table.insert(actorList,p)
  table.insert(actorList, Timer(2, function() local coin = Coin(); table.insert(actorList, coin) end, true))
  table.insert(actorList, Timer(4, function() local ground = Ground(); table.insert(actorList, ground) end, false))
end

function love.update(dt)
  for _,v in ipairs(actorList) do
    if checkIfDead(v) then
      table.remove(actorList, _)
    end
    v:update(dt)
    print(#actorList)
  end
end

function love.draw()
  for _,v in ipairs(actorList) do
    v:draw()
  end
end

function checkIfDead(object)
  if object:is(Coin) and object.delete or object:is(Ground) and object.delete then
    return true
  end
end

