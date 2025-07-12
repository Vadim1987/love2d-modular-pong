-- Paddle module: vertical + horizontal movement

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

function Paddle:update(dt, vdir, hdir)
    -- Vertical
    if vdir ~= 0 then
        self.vspeed = PADDLE_SPEED * vdir
        self.y = math.max(0, math.min(WINDOW_HEIGHT - self.height, self.y + self.vspeed * dt))
    else
        self.vspeed = 0
    end
    -- Horizontal (до центра поля)
    if hdir ~= 0 then
        local minX = self.isPlayer and 0 or (WINDOW_WIDTH / 2 + 10)
        local maxX = self.isPlayer and BAT_MAX_X or (WINDOW_WIDTH - PADDLE_WIDTH)
        self.hspeed = PADDLE_HSPEED * hdir
        self.x = math.max(minX, math.min(maxX, self.x + self.hspeed * dt))
    else
        self.hspeed = 0
    end
end

function Paddle:draw()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

return Paddle

       
