local Object = Object or require "resources/lib/classic"

Background = Object:extend()

function  Background:new()
    skyBackground = love.graphics.newImage("resources/textures/background.jpg")
    cloud1 = love.graphics.newImage("resources/textures/cloud1.png")
    cloud2 = love.graphics.newImage("resources/textures/cloud2.png")
    cloud3 = love.graphics.newImage("resources/textures/cloud3.png")
    cloud4 = love.graphics.newImage("resources/textures/cloud4.png")
    cloud5 = love.graphics.newImage("resources/textures/cloud5.png")
    cloud6 = love.graphics.newImage("resources/textures/cloud6.png")
    cloud7 = love.graphics.newImage("resources/textures/cloud7.png")

    cloudX1 = -1200
    cloudY1 = 0
    cloudSpeed1 = 50

    cloudX2 = 1280
    cloudY2 = 100
    cloudSpeed2 = -90

    cloudX3 = -1200
    cloudY3 = 200
    cloudSpeed3 = 45

    cloudX4 = -1500
    cloudY4 = 250
    cloudSpeed4 = -20

    cloudX5 = -1700
    cloudY5 = 400
    cloudSpeed5 = 75

    cloudX6 = -800
    cloudY6 = 500
    cloudSpeed6 = 100

    cloudX7 = 1280
    cloudY7 = 550
    cloudSpeed7 = -25
end

function  Background:update(dt)
    if cloudX1 >= 1280 or cloudY1 >= 720 then
        cloudX1 = -1200
        cloudY1 = 0
    elseif cloudX2 <= -1400 or cloudY2 <= -500 then
        cloudX2 = 1280
        cloudY2 = 100
    elseif cloudX3 >= 1280 or cloudY3 >= 720 then
        cloudX3 = -1200
        cloudY3 = 200
    elseif cloudX4 >= -1500 or cloudY4 <= -300 then
        cloudX4 = -1500
        cloudY4 = 250
    elseif cloudX5 >= 1280 or cloudY5 >= 720 then
        cloudX5 = -1700
        cloudY5 = 400
    elseif cloudX6 >= 1280 or cloudY6 >= 720 then
        cloudX6 = -800
        cloudY6 = 500
    elseif cloudX7 >= -1000 or cloudY7 <= -300 then
        cloudX7 = 1280
        cloudY7 = 550
    end

    if ghostMode == 1 then
        cloudX1 = cloudX1 + cloudSpeed1 * dt
        cloudY1 = cloudY1 - cloudSpeed1 * dt

        cloudX2 = cloudX2 + cloudSpeed2 * dt
        cloudY2 = cloudY2 + cloudSpeed2 * dt

        cloudX3 = cloudX3 + cloudSpeed3 * dt
        cloudY3 = cloudY3 - cloudSpeed2 * dt

        cloudX4 = cloudX4 + cloudSpeed4 * dt
        cloudY4 = cloudY4 + cloudSpeed2 * dt

        cloudX5 = cloudX5 + cloudSpeed5 * dt
        cloudY5 = cloudY5 - cloudSpeed2 * dt

        cloudX6 = cloudX6 + cloudSpeed6 * dt
        cloudY6 = cloudY6 - cloudSpeed6 * dt

        cloudX7 = cloudX7 + cloudSpeed7 * dt
        cloudY7 = cloudY7 + cloudSpeed7 * dt
    else
        cloudX1 = cloudX1 + cloudSpeed1 * dt
        cloudY1 = cloudY1 + cloudSpeed1 * dt

        cloudX2 = cloudX2 + cloudSpeed2 * dt
        cloudY2 = cloudY2 - cloudSpeed2 * dt

        cloudX3 = cloudX3 + cloudSpeed3 * dt
        cloudY3 = cloudY3 + cloudSpeed2 * dt

        cloudX4 = cloudX4 + cloudSpeed4 * dt
        cloudY4 = cloudY4 - cloudSpeed2 * dt

        cloudX5 = cloudX5 + cloudSpeed5 * dt
        cloudY5 = cloudY5 + cloudSpeed2 * dt

        cloudX6 = cloudX6 + cloudSpeed6 * dt
        cloudY6 = cloudY6 + cloudSpeed6 * dt

        cloudX7 = cloudX7 + cloudSpeed7 * dt
        cloudY7 = cloudY7 - cloudSpeed7 * dt
    end
end

function  Background:draw()
    love.graphics.draw(skyBackground, 0, 0, 0, 0.7, 0.7)

    love.graphics.draw(cloud1, cloudX1, cloudY1, 0, 2, 2)
    love.graphics.draw(cloud2, cloudX2, cloudY2, 0, 2, 2)
    love.graphics.draw(cloud3, cloudX3, cloudY3, 0, 2, 2)
    love.graphics.draw(cloud4, cloudX4, cloudY4, 0, 2, 2)
    love.graphics.draw(cloud5, cloudX5, cloudY5, 0, 2, 2)
    love.graphics.draw(cloud6, cloudX6, cloudY6, 0, 2, 2)
    love.graphics.draw(cloud7, cloudX7, cloudY7, 0, 2, 2)
end