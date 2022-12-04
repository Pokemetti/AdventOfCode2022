local file = io.open("puzzle.txt")

full_overlaps = 0

newline = "\n"
while newline == "\n" do
	first_low = file:read("*n")
	dash = file:read(1)
	first_high = file:read("*n")
	comma = file:read(1)
	second_low = file:read("*n")
	dash = file:read(1)
	second_high = file:read("*n")
	newline= file:read(1)
	if ((first_low <= second_low and first_high >= second_high) or (first_low >= second_low and first_high <= second_high)) then
		full_overlaps = full_overlaps + 1
	end
end

print(full_overlaps)