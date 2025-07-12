-- Invert ball velocity relative to moving bat at collision (not just flip dx!)
local function clamp(val, min, max)
    return math.max(min, math.min(max, val))
end

local function sweptCollision(ball, paddle)
    local steps = 8
    for i=1,steps do
        local t = i / steps
        local test_x = ball.prev_x + (ball.x - ball.prev_x) * t
        local test_y = ball.prev_y + (ball.y - ball.prev_y) * t
        local closestX = clamp(test_x, paddle.x, paddle.x + paddle.width)
        local closestY = clamp(test_y, paddle.y, paddle.y + paddle.height)
        local dx = test_x - closestX
        local dy = test_y - closestY
        if (dx*dx + dy*dy) <= (ball.radius * ball.radius) then
            ball.x, ball.y = test_x, test_y
            return true
        end
    end
    return false
end

-- Bounce relative to moving bat (proper velocity frame inversion)
local function bounceRelative(ball, paddle)
    -- Найдем точку контакта
    local closestX = clamp(ball.x, paddle.x, paddle.x + paddle.width)
    local closestY = clamp(ball.y, paddle.y, paddle.y + paddle.height)
    local nx = ball.x - closestX
    local ny = ball.y - closestY
    local len = math.sqrt(nx * nx + ny * ny)
    if len == 0 then nx,ny = 1,0 else nx,ny = nx/len, ny/len end

    -- Скорость мяча относительно ракетки
    local rvx = ball.dx - (paddle.hspeed or 0)
    local rvy = ball.dy - (paddle.vspeed or 0)
    local vDotN = rvx * nx + rvy * ny
    -- Отразим относительную скорость по нормали
    rvx = rvx - 2 * vDotN * nx
    rvy = rvy - 2 * vDotN * ny
    -- Переводим обратно в глобальную систему
    ball.dx = rvx + (paddle.hspeed or 0)
    ball.dy = rvy + (paddle.vspeed or 0)
end

return {
    sweptCollision = sweptCollision,
    bounceRelative = bounceRelative
}

   
