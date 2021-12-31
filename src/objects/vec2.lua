local Vec2 = {}

function Vec2:new(x,y)
    local vec2 = {}

    vec2.x = x or 0
    vec2.y = y or 0

    function vec2:move(dvec2)
        self.x = self.x + dvec2.x
        self.y = self.y + dvec2.y
    end

    return vec2
end

return Vec2