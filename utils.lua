-- Perspective transform function for first-person rendering

function perspective(x, y, h)
    -- x: field x (0 at player's side), y: field y (0=center), h: height offset for 3D effect
    local xm = x - PADDLE_OFFSET_X      -- 0 at player's edge
    local ym = y - WINDOW_HEIGHT / 2    -- 0 at table center
    local s = PROJ_S
    local d = PROJ_D
    local cx = PROJ_CX
    local cy = PROJ_CY
    -- Prevent division by zero
    if xm < 1 then xm = 1 end
    local screen_x = s * (ym + d / xm) + cx
    local screen_y = s * (h + d / xm) + cy
    return screen_x, screen_y
end
