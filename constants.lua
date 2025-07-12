-- Window dimensions
WINDOW_WIDTH = 800
WINDOW_HEIGHT = 600

-- Paddle (bat) settings
PADDLE_WIDTH = 18
PADDLE_HEIGHT = 60
PADDLE_SPEED = 300         -- Both axes

-- Horizontal/vertical bat movement limits (player half only)
BAT_MIN_X = 30
BAT_MAX_X = (WINDOW_WIDTH / 2) - PADDLE_WIDTH - 10

BAT_MIN_Y = (WINDOW_HEIGHT / 2) - 100
BAT_MAX_Y = (WINDOW_HEIGHT / 2) + 100 - PADDLE_HEIGHT

-- Ball (puck) settings (now circle)
BALL_SIZE = 14              -- Puck radius
BALL_SPEED_X = 240
BALL_SPEED_Y = 120

-- 3D/projection constants (tweak for your taste)
PROJ_S = 320
PROJ_D = 650
PROJ_CX = WINDOW_WIDTH / 2
PROJ_CY = 0
BAT_HEIGHT_3D = 40
PUCK_HEIGHT_3D = 20

-- Score
WIN_SCORE = 10

-- Offsets
PADDLE_OFFSET_X = BAT_MIN_X
SCORE_OFFSET_Y = 40

-- Grid
GRID_X = 8
GRID_Y = 3

-- Colors
COLOR_BG = {0, 0, 0}
COLOR_FG = {1, 1, 1}

