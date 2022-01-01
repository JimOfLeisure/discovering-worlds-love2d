Map = {}

vec2 = require("objects/vec2")

-- Local referecnes for speed improvements
local love_noise = love.math.noise
local graphics = love.graphics

function Map:new()
    local map = {}
    map.seed = vec2:new(0.1, 0.1)
    map.noise_mult = 0.002
    function map:noise(pos)
        return love_noise(pos.x * self.noise_mult + self.seed.x, pos.y * self.noise_mult + self.seed.y)
    end
    function map:draw(pos)
        for j=-0,600,5 do
            for i=-0,800,5 do
                local x = player.pos.x * 20 + i - 400
                local y = player.pos.y * 20 + j - 300
                local h = self:noise(vec2:new(x,y))
                graphics.setColor(h, h, h)
                graphics.rectangle("fill", i, j, 5, 5)
            end
        end
    end
    return map
end

return Map