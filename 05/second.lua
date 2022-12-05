local file = io.open("puzzle.txt")


local stacks = {}

-- Helper function
local function add_to_stack(stacks, index, value)
	if stacks[index] == nil then
		stacks[index] = {}
	end
	stacks[index][#stacks[index] + 1] = value
end

-- Read the initial state of the stacks
local quad
local row = 1
while true do
	quad = file:read(4)
	first = quad:sub(1,1)
	second = quad:sub(2,2)
	fourth = quad:sub(4,4)
	if first == "[" then
		add_to_stack(stacks, row, second)
	end
	if first == " " and second ~= " " then
		file:read("*l")
		file:read("*l")
		break
	end
	row = row + 1
	if fourth == "\n" then
		row = 1
	end
end
-- Reverse the stacks
for n,t in ipairs(stacks) do
	local copy = {}
	for i = #t, 1, -1 do
		copy[#copy + 1] = t[i]
	end
	stacks[n] = copy
end

-- Interprete the instructions
while true do
	file:read(5) -- Remove "move "
	local num = file:read("*n")
	file:read(6) -- Remove " from "
	local from = file:read("*n")
	file:read(4) -- Remove " to "
	local to = file:read("*n")
	file:read(1) -- Remove newline
	if num and from and to then
		from = stacks[from]
		to = stacks[to]
		local copy = {}
		for i = #from - num + 1, #from do
			copy[#copy + 1] = from[i]
			from[i] = nil
		end
		for i = 1, #copy do
			to[#to + 1] = copy[i]
		end
	else
		break
	end
end

for i = 1, #stacks do
	local table = stacks[i]
	if #table > 0 then
		io.write(table[#table])
	end
end