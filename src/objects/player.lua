Player = {}

vec2 = require("objects/vec2")

-- Local referecnes for speed improvements
local graphics = love.graphics

function Player:new(pos)
    local player = {}

    player.pos = pos or vec2:new()

    function player:draw()
        graphics.push()
        graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
        graphics.setColor(1, 0, 0)
        graphics.circle("fill", 0, 0, 10)
        graphics.pop()
    end

    return player
end

return Player
