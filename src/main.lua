Map = require("objects/map")
vect = require("objects/vec2")
Player = require("objects/player")

-- Local referecnes for speed improvements
local graphics = love.graphics

local map = Map:new()
local player = Player:new()

function love.load()
end

function love.update(dt)
end

function love.draw()
    map:draw()
    player:draw()
end

function love.keypressed(key)
    if love.keyboard.isDown("left") then
        player.pos:move(vec2:new(-10, 0))
    end
end
