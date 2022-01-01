Map = require("objects/map")
vect = require("objects/vec2")
Player = require("objects/player")

-- Local referecnes for speed improvements
local graphics = love.graphics

local map = Map:new()
player = Player:new()

function love.load()
    map:load()
end

function love.update(dt)
end

function love.draw()
    map:draw(player.pos)
    player:draw()
end

function love.keypressed(key)
    if love.keyboard.isDown("left") then
        player.pos:move(vec2:new(-1, 0))
    end
    if love.keyboard.isDown("right") then
        player.pos:move(vec2:new(1, 0))
    end
    if love.keyboard.isDown("up") then
        player.pos:move(vec2:new(0, -1))
    end
    if love.keyboard.isDown("down") then
        player.pos:move(vec2:new(0, 1))
    end
end
