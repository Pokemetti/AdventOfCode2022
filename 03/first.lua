local file = io.open("puzzle.txt")

local lowercase = "abcdefghijklmnopqrstuvwxyz"
local uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

local input = file:read("*l")
local score = 0
while input do
	local length = #input
	local half = math.floor(length / 2)
	local first_half = input:sub(1, half)
	local second_half = input:sub(half + 1, length)
	for i = 1, #first_half do
		char = first_half:sub(i, i)
		if second_half:find(char) then
			score = score + char:byte() - (lowercase:find(char) and 96 or 38)
			break
		end
	end
	-- Read the next line
	input = file:read("*l")
end

print(score)