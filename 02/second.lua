-- Open the file lol
local file = io.open("puzzle.txt")

-- Table for how many points a shape gives
local shape_points = {
	X = 1,
	Y = 2,
	Z = 3
}
-- Table for how many points a win, draw or lose give
local win_points = {
	W = 6,
	D = 3,
	L = 0
}

-- Table for converting from X,Y,Z to W(in), D(raw), L(ose)
local win_chart = {
	X = "L",
	Y = "D",
	Z = "W"
}

-- The shapes to choose according to the other's shape
local winning_shapes = {
	A = "Y",
	B = "Z",
	C = "X"
}
local losing_shapes = {
	A = "Z",
	B = "X",
	C = "Y"
}
local drawing_shapes = {
	A = "X",
	B = "Y",
	C = "Z"
}
-- Table for choosing the right table to either lose, draw or win
local right_table = {
	W = winning_shapes,
	D = drawing_shapes,
	L = losing_shapes
}

local score = 0

repeat
	-- Read the next line from the file
	local input = file:read("*l")
	if input == nil then
		-- Break if the end has been reached
		break
	end

	local first_char = input:sub(1, 1)
	local last_char = input:sub(#input, #input)
	
	-- Whether you are supposed to win, draw or lose
	local outcome = win_chart[last_char]
	-- The shape that is chosen accordingly
	local shape = right_table[outcome][first_char]

	score = score + win_points[win_chart[last_char]] + shape_points[shape]
until input == nil

print(score)