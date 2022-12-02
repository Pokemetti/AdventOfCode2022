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

-- Table for determining win
local win_chart = {
	["A X"] = "D",
	["A Y"] = "W",
	["A Z"] = "L",
	["B X"] = "L",
	["B Y"] = "D",
	["B Z"] = "W",
	["C X"] = "W",
	["C Y"] = "L",
	["C Z"] = "D"
}

local score = 0

local input = file:read("*l")
while input do
	local last_char = input:sub(#input, #input)
	
	-- Whether you are supposed to win, draw or lose
	local outcome = win_chart[input]
	score = score + win_points[outcome] + shape_points[last_char]

	-- Read the next line from the file
	input = file:read("*l")
end

print(score)