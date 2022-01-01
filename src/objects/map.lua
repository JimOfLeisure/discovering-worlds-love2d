Map = {}

local vec2 = require("objects/vec2")

-- Local referecnes for speed improvements
local love_noise = love.math.noise
local graphics = love.graphics

local map_image

local seed = vec2:new(0.1, 0.1)
local noise_mult = 0.002
local function noise(pos)
    return love_noise(pos.x * noise_mult + seed.x, pos.y * noise_mult + seed.y)
end

local function perlin_map_data()
    local map_image_data = love.image.newImageData(1600, 1200)
    map_image_data:mapPixel(function(x,y)
        local h = noise(vec2:new(x,y))
        return h, h, h, 1
    end)
    -- for x= 0, 1200 do
    --     for y= 0, 1600 do
    --         local h = noise(vec2:new(x,y))
    --         map_image_data:replacePixels(x, y, h, h, h, 1)
    --     end
    -- end
    local image = love.graphics.newImage(map_image_data)
    return image
end

function Map:new()
    local map = {}
    map.seed = vec2:new(0.1, 0.1)
    map.noise_mult = 0.002
    function map:noise(pos)
        return love_noise(pos.x * self.noise_mult + self.seed.x, pos.y * self.noise_mult + self.seed.y)
    end

    function map:load()
        -- local map_image_data = love.image.newImageData(1600, 1200)
        -- map_image = love.graphics.newImage(map_image_data)
        -- for x= 0, 1200 do
        --     for y= 0, 1600 do
        --         local h = self:noise(vec2:new(x,y))
        --         map_image:replacePixels(x, y, h, h, h, 1)
        --     end
        -- end
        map_image = perlin_map_data()
    end

    function map:draw(pos)
        -- for j= 0, 600, 5 do
        --     for i= 0, 800, 5 do
        --         local x = player.pos.x * 20 + i - 400
        --         local y = player.pos.y * 20 + j - 300
        --         local h = self:noise(vec2:new(x,y))
        --         graphics.setColor(h, h, h)
        --         graphics.rectangle("fill", i, j, 5, 5)
        --     end
        -- end
        graphics.setColor(1, 1, 1, 1)
        graphics.draw(map_image, -player.pos.x * 20, -player.pos.y * 20)
    end

    return map
end

return Map