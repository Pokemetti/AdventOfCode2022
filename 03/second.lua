local file = io.open("puzzle.txt")

local lowercase = "abcdefghijklmnopqrstuvwxyz"
local uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

local input = {file:read("*l"),file:read("*l"),file:read("*l")}
local score = 0
while input[1] and input[2] and input[3] do
	local first_line, second_line, third_line = input[1], input[2], input[3]
	for i = 1, #first_line do
		local char = first_line:sub(i, i)
		local second_found, _, third_found, _ = second_line:find(char), third_line:find(char)
		local badge = second_found and third_found
		if badge then
			score = score + char:byte() - (lowercase:find(char) and 96 or 38)
			break
		end
	end
	-- Read the next line
	input = {file:read("*l"),file:read("*l"),file:read("*l")}
end

print(score)