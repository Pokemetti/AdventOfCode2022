local file = io.open("puzzle.txt")

local input = file:read"*a"

file:close()

local table = {}
for i = 14, #input do
	local dekaquadruple = input:sub(i - 13, i)
	local found = true
	table = {}
	for j = 1,#dekaquadruple do
		local c = dekaquadruple:sub(j, j)
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