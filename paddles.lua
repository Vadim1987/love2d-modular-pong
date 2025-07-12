-- Paddle module with vertical + horizontal movement

local Paddle = {}
Paddle.__index = Paddle

function Paddle:create(x, y, isPlayer)
    local paddle = setmetatable({}, self)
    paddle.x = x
    paddle.y = y
    paddle.width = PADDLE_WIDTH
    paddle.height = PADDLE_HEIGHT
    paddle.vspeed = 0
    paddle.hspeed = 0
    paddle.isPlayer = isPlayer or false
    return paddle
end

-- vdir: depth (table axis), hdir: width (screen horizontal)
function Paddle:update(dt, vdir, hdir)
    -- Move along X (depth)
    if vdir ~= 0 then
        self.x = math.max(BAT_MIN_X, math.min(BAT_MAX_X, self.x + vdir * PADDLE_SPEED * dt))
    end
    -- Move along Y (width)
    if hdir ~= 0 then
        self.y = math.max(BAT_MIN_Y, math.min(BAT_MAX_Y, self.y + hdir * PADDLE_SPEED * dt))
    end
end

function Paddle:draw()
    -- Perspective rendering in main.lua!
    -- This method is now optional or could be used for debug.
end

return Paddle
