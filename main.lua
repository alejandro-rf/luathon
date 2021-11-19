Player = Player or require "resources/src/player"
Coin = Coin or require "resources/src/coin"
BadCoin = BadCoin or require "resources/src/badcoin"
Timer = Timer or require "resources/lib/timer"
Ground = Ground or require "resources/src/Ground"
PlayerDead = PlayerDead or require "resources/src/PlayerDead"
Ghost = Ghost or require "resources/src/Ghost"
Data = Data or require "data"
require "resources/src/background"

actorList = {}  --Lista de elementos de juego
clouds = Background()

function love.load()
  local p = Player()
  local g = Ground()
  d = PlayerDead()
  table.insert(actorList,p)
  table.insert(actorList, Timer(2, function() local coin = Coin(); table.insert(actorList, coin) end, true))
  table.insert(actorList, Timer(4, function() local ground = Ground(); table.insert(actorList, ground) end, false))
  ghostMode = 1
end

function love.update(dt)
  --BackgroundClouds(dt)
  clouds:update(dt)

  for _,v in ipairs(actorList) do
    if checkIfDead(v) then
      table.remove(actorList, _)
    end
    v:update(dt)
    d:update(dt)
    if v:is(Player) and v.Dead then
      
      if ghostMode == 1 then
        local ghost = Ghost()
        table.insert(actorList, ghost)
      end
      ghostMode = ghostMode + 1
    end
    --print(#actorList) --DEBUG: NUMBER OF ACTORS IN LIST
  end
end

function love.draw()
  clouds:draw()
  for _,v in ipairs(actorList) do
    v:draw()
    if v:is(Player) and v.Dead then
      d:draw()
    end
  end
end

function checkIfDead(object)
  if object:is(Coin) and object.delete or object:is(BadCoin) and object.delete or object:is(Ground) and object.delete or object:is(Timer) and object.delete then
    return true
  end
end

--[[function  BackgroundClouds(dt)
  clouds:update(dt)

  function love.draw()
    clouds:draw()
  end
end]]--