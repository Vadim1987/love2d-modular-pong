-- Window dimensions
WINDOW_WIDTH = 800
WINDOW_HEIGHT = 600

-- Paddle settings
PADDLE_WIDTH = 10
PADDLE_HEIGHT = 60
PADDLE_SPEED = 300         -- Vertical speed
PADDLE_HSPEED = 200        -- Horizontal speed

-- Horizontal paddle movement limits (not beyond half field)
BAT_MAX_X = (WINDOW_WIDTH / 2) - PADDLE_WIDTH - 10      -- For player (left)
BAT_MIN_X_OPP = (WINDOW_WIDTH / 2) + 10                 -- For opponent (right)

-- Ball settings (now circle)
BALL_SIZE = 10              -- This is the puck RADIUS!
BALL_SPEED_X = 240
BALL_SPEED_Y = 120

-- Score limit
WIN_SCORE = 10

-- Positioning
PADDLE_OFFSET_X = 30        -- Initial paddle offset from side
SCORE_OFFSET_Y = 40         -- Score display height

-- Colors (RGB in [0,1])
COLOR_BG = {0, 0, 0}
COLOR_FG = {1, 1, 1}

