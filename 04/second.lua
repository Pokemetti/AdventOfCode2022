local file = io.open("puzzle.txt")

overlaps = 0

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
	if ((first_low <= second_high and first_low >= second_low) or (second_low <= first_high and second_low >= first_low)) then
		overlaps = overlaps + 1
	end
end

print(overlaps)