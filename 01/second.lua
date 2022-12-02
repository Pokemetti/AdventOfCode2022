-- Advent of Code

file = io.open("puzzle.txt")

elves = {}
current_elve = 0
running = true

while running do
	::reading::
	input = file:read("*l")
	if input == "" then
		-- new line, new luck
		elves[#elves + 1] = current_elve
		current_elve = 0
		goto reading
	end
	if input == nil then
		running = false
	end

	number = tonumber(input)
	if number then
		current_elve = current_elve + number
	end
end

table.sort(elves)
top_three = elves[#elves] + elves[#elves - 1] + elves[#elves - 2]
print(top_three)