Player = Player or require "resources/src/player"
Coin = Coin or require "resources/src/coin"
BadCoin = BadCoin or require "resources/src/badcoin"
Timer = Timer or require "resources/lib/timer"
Ground = Ground or require "resources/src/Ground"
PlayerDead = PlayerDead or require "resources/src/PlayerDead"
Ghost = Ghost or require "resources/src/Ghost"
Data = Data or require "data"
Clouds = Clouds or require "resources/src/Background"
Intro = Intro or require "resources/lib/intro"
Intro2 = Intro2 or require "resources/lib/intro2"
actorList = {}  --Lista de elementos de juego

function love.load()

  love.graphics.setFont(love.graphics.newFont("resources/font/pong.ttf", 80))
  playerScore = 0
  intro = intro.init("resources/vid/Intro.ogv")
	intro.play()

  intro2 = intro2.init("resources/vid/finally.ogv")

  musicFall = love.audio.newSource("resources/sound/fallMusic.wav", "stream")
  musicFall:setVolume(0.3)
  musicUp = love.audio.newSource("resources/sound/musicUp.wav","stream")
  musicUp:setVolume(0.3)

  local p = Player()
  local g = Ground()
  background = Background()
  d = PlayerDead()
  table.insert(actorList,p)
  table.insert(actorList, Timer(2, function() local coin = Coin(); table.insert(actorList, coin) end, true))
  table.insert(actorList, Timer(20, function() local ground = Ground(); table.insert(actorList, ground) end, false))
  ghostMode = 1
  play1 = 1
  timerExist = false
end

function love.update(dt)
  --BackgroundClouds(dt)
  --Clouds:update(dt)
  if not intro.video:isPlaying() then
    musicFall:play()
    background:update(dt)
  for _,v in ipairs(actorList) do
    if checkIfDead(v) then
      table.remove(actorList, _)
    end
    v:update(dt)
    d:update(dt)
    if v:is(Player) and v.Dead then
      
      if ghostMode == 1 then
        
        local ghost = Ghost(d.position.x + 100)
        table.insert(actorList, ghost)
      end
      ghostMode = ghostMode + 1
      musicFall:stop()
      musicUp:play()
    end
    print(#actorList) --DEBUG: NUMBER OF ACTORS IN LIST
  end
  end
  
end

function love.draw()
  love.graphics.setBackgroundColor( 0,0,0) --not very useful,just set the default color and the background color
	love.graphics.setColor(255, 255, 255)
	if intro.video:isPlaying() then love.graphics.draw(intro.video, intro.x,intro.y, 0, intro.scale) 
  else

    background:draw()
    love.graphics.print("Score: "..tostring(playerScore), Data.SCREEN_WIDTH - 470, 30)
    for _,v in ipairs(actorList) do
      v:draw()
        if v:is(Player) and v.Dead then
          
          d:draw()

        end
    end
  end
  love.graphics.setBackgroundColor( 0,0,0) --not very useful,just set the default color and the background color
	love.graphics.setColor(255, 255, 255)
  
  if isPlaying  then
    if intro2.video:isPlaying() then love.graphics.draw(intro2.video, intro2.x,intro2.y, 0, intro2.scale) 
      if not timerExist then
       table.insert(actorList, Timer(44, function() love.event.quit() end, false))
       timerExist = true
      end
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