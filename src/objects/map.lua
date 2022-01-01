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
    local image = love.graphics.newImage(map_image_data)
    return image
end

local function generated_map()
    local map_image_data = love.image.newImageData(1600, 1200)
    map_image_data:mapPixel(function(x,y)
        -- temporarily, everything is ocean blue
        return 0, 0.412, 0.58, 1
    end)
    local image = love.graphics.newImage(map_image_data)
    return image
end

function Map:new()
    local map = {}

    function map:load()
        -- map_image = perlin_map_data()
        map_image = generated_map()
    end

    function map:draw(pos)
        graphics.setColor(1, 1, 1, 1)
        graphics.draw(map_image, -player.pos.x * 20, -player.pos.y * 20)
    end

    return map
end

return Map