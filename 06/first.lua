local file = io.open("puzzle.txt")

local input = file:read"*a"

file:close()

local table = {}
for i = 4, #input do
	local quadruple = input:sub(i - 3, i)
	local found = true
	table = {}
	for j = 1,#quadruple do
		local c = quadruple:sub(j, j)
		if table[c] then
			found = false
			break
		end
		table[c] = true
	end
	if found then
		print(i)
		break
	end
end