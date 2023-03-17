require 'date'
require_relative './grid'

def fillDate(date)
	200.times do |i|
		offset = date.to_datetime + Rational(i, 8640)
		system("git commit --quiet --allow-empty --date=#{offset.to_s} -m \"Welcome to my death maze, fool\"")
	end
end

# Each row of the maze = 2 weeks
height = 100
grid = Grid.new(height, 3)
grid.print()

# This date must be a Sunday!
first_date = Date.new(2022,2,13)

grid.cells.each do |cell|
	new_date = first_date + (cell.y * 14 + cell.x * 2 + 1)
	fillDate(new_date + 8)
	if cell.connections['east'].nil?
		fillDate(new_date + 1)
	end
	if cell.connections['south'].nil?
		fillDate(new_date + 7)
	end

	if cell.x === 0
		fillDate(new_date - 1)
		fillDate(new_date + 6)
	end

	p "#{cell.x}, #{cell.y}"
	system('git push --quiet')
	sleep(2)
end