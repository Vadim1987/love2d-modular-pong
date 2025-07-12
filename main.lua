-- main.lua
-- Entry point and game loop for Modular Pong

local const = require "constants"
local Paddles = require "paddles"
local Puck = require "puck"
local AI = require "ai"
local Collision = require "collision"
local Render = require "render"

local game = {}

function love.load()
    -- Initialize paddles, puck, scores, AI strategy and bounce function
    game.left = Paddles.create(const.LEFT_X, const.PADDLE_INIT_Y)
    game.right = Paddles.create(const.RIGHT_X, const.PADDLE_INIT_Y)
    game.puck = Puck.create()
    game.scores = {player = 0, cpu = 0}
    game.ai_strategy = AI.perfect -- Change to other strategies as needed
    game.bounce_func = Collision.basic
    love.graphics.setBackgroundColor(const.COLOR_BG)
end

function love.update(dt)
    -- Update paddles and puck positions
    Paddles.updatePlayer(game.left, dt)
    AI.update(game.right, game.puck, game.left, game.ai_strategy, dt)
    Puck.update(game.puck, dt)

    -- Check for wall and paddle collisions
    Collision.checkWall(game.puck)
    local side = Collision.checkPaddle(game.puck, game.left, game.right, game.bounce_func)

    -- Check if puck goes out of bounds and update score
    if Puck.outLeft(game.puck) then
        game.scores.cpu = math.min(game.scores.cpu + 1, const.MAX_SCORE)
        game.puck = Puck.create(-1)
    elseif Puck.outRight(game.puck) then
        game.scores.player = math.min(game.scores.player + 1, const.MAX_SCORE)
        game.puck = Puck.create(1)
    end
end

function love.draw()
    -- Render field, paddles, puck, dotted line and scores
    Render.drawField()
    Render.drawDottedLine()
    Render.drawScore(game.scores)
    Paddles.draw(game.left)
    Paddles.draw(game.right)
    Puck.draw(game.puck)
end

function love.keypressed(key)
    -- Quit game on ESC
    if key == "escape" then love.event.quit() end
end
