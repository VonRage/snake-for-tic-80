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
	y_pos = 0
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
								LBLUE)
		end
	end
	
	rect(grid(snake_head.x_pos) - (x_dir * t),
						grid(snake_head.y_pos) - (y_dir * t),
						4,
						4,
						CYAN)
end -- DRAW

function move()
	x_dir = 0
	y_dir = 0
			
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
-- <TILES>
-- 001:eccccccccc888888caaaaaaaca888888cacccccccacc0ccccacc0ccccacc0ccc
-- 002:ccccceee8888cceeaaaa0cee888a0ceeccca0ccc0cca0c0c0cca0c0c0cca0c0c
-- 003:eccccccccc888888caaaaaaaca888888cacccccccacccccccacc0ccccacc0ccc
-- 004:ccccceee8888cceeaaaa0cee888a0ceeccca0cccccca0c0c0cca0c0c0cca0c0c
-- 017:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 018:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- 019:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 020:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- </TILES>

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

