-- paddles.lua
-- Paddle logic: creation, movement, drawing

local const = require "constants"

local Paddles = {}

-- Create a new paddle at (x, y)
function Paddles.create(x, y)
    return {x = x, y = y, vy = 0}
end

-- Update player's paddle with keyboard input
function Paddles.updatePlayer(paddle, dt)
    paddle.vy = 0
    if love.keyboard.isDown("q") then
        paddle.vy = -const.PADDLE_SPEED
    elseif love.keyboard.isDown("a") then
        paddle.vy = const.PADDLE_SPEED
    end
    paddle.y = math.max(0, math.min(const.WINDOW_HEIGHT - const.PADDLE_HEIGHT, paddle.y + paddle.vy * dt))
end

-- Draw the paddle
function Paddles.draw(paddle)
    love.graphics.setColor(const.COLOR_FG)
    love.graphics.rectangle("fill", paddle.x, paddle.y, const.PADDLE_WIDTH, const.PADDLE_HEIGHT)
end

return Paddles
