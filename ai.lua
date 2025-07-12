-- AI module: now with horizontal-aware strategies

local AI = {}

function AI.perfect(ball, paddle)
    -- Centers paddle both vertically and horizontally (cheater mode)
    local vdir = 0
    local hdir = 0
    local cy = paddle.y + paddle.height / 2
    local cx = paddle.x + paddle.width / 2
    if ball.y < cy - 2 then vdir = -1 elseif ball.y > cy + 2 then vdir = 1 end
    if ball.x < cx - 2 then hdir = -1 elseif ball.x > cx + 2 then hdir = 1 end
    return vdir, hdir
end

function AI.side_bias(ball, paddle)
    -- Иногда перемещается к краям (играет креативно)
    local vdir = 0
    local hdir = 0
    local cy = paddle.y + paddle.height / 2
    if ball.y < cy - 10 then vdir = -1 elseif ball.y > cy + 10 then vdir = 1 end
    if ball.dx > 0 and ball.x > WINDOW_WIDTH / 2 then
        -- Ждет мяч справа, смещается к стенке
        hdir = 1
    else
        -- Иначе центрируется
        local cx = paddle.x + paddle.width / 2
        if ball.x < cx - 5 then hdir = -1 elseif ball.x > cx + 5 then hdir = 1 end
    end
    return vdir, hdir
end

function AI.random(ball, paddle)
    -- Рандомно двигается
    return math.random(-1,1), math.random(-1,1)
end

return AI


