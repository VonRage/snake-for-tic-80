-- title:   game title
-- author:  game developer, email, etc.
-- desc:    short description
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

-- globals
DBLUE = 8
BLUE = 9
LBLUE = 10
CYAN = 11

CELL_SIZE = 8
GRID_SIZE = 16
BORDER = CELL_SIZE / 2

TIME = 8
t = TIME
x = 96
y = 24
x_dir = 0
y_dir = 0
dir_new = 0

snake_head = {
	x_pos = 0,
	y_pos = 0,
	dir = 0
}

function TIC()
	INPUTS()
	UPDATES()
	DRAW()
end -- TIC

function INPUTS()
	if btn(0) then dir_new = 0 end -- up
	if btn(3) then dir_new = 1 end -- right
	if btn(1) then dir_new = 2 end -- down
	if btn(2) then dir_new = 3 end -- left
end -- INPUTS

function UPDATES()
	t = t - 1
	
	if t == 0 then
		move()
		t = TIME
	end
end -- UPDATES

function DRAW()
	cls(DBLUE)
	
	for _x = BORDER, CELL_SIZE * GRID_SIZE, CELL_SIZE do
		for _y = BORDER, CELL_SIZE * GRID_SIZE, CELL_SIZE do
			rectb(_x,
								_y,
								CELL_SIZE - 1,
								CELL_SIZE - 1,
								BLUE)
		end
	end

	--[[ old snake head	
	rect(grid(snake_head.x_pos) - (x_dir * t),
						grid(snake_head.y_pos) - (y_dir * t),
						4,
						4,
						CYAN)
	--]]
	
	snakehead = {
		x = grid(snake_head.x_pos) - (x_dir * t),
		y = grid(snake_head.y_pos) - (y_dir * t)
	}
	spr(272 + snake_head.dir,
					snakehead.x,
					snakehead.y,
					0)
end -- DRAW

function move()
	x_dir = 0
	y_dir = 0
	snake_head.dir = dir_new
			
	if dir_new == 0 then
		y_dir = -1
	elseif dir_new == 1 then
		x_dir = 1
	elseif dir_new == 2 then
		y_dir = 1
	elseif dir_new == 3 then
		x_dir = -1
	end
	
	snake_head.x_pos = snake_head.x_pos + x_dir
	snake_head.y_pos = snake_head.y_pos + y_dir
end -- move

-- returns the top left corner of grid position
function grid(val)
	return BORDER + (val * CELL_SIZE)
end -- grid
-- <SPRITES>
-- 016:0002000000aaa00000aaa0000adada000daaad000aaaaa000aaaaa0000000000
-- 017:000000000aada0000aaadaa00aaaaaa20aaadaa00aada0000000000000000000
-- 018:000000000aaaaa000aaaaa000daaad000adada0000aaa00000aaa00000020000
-- 019:00000000000adaa00aadaaa02aaaaaa00aadaaa0000adaa00000000000000000
-- </SPRITES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

