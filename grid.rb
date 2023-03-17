require_relative './cell'

class Grid
	attr_accessor :cells

	def initialize(height, width)
		@width = width
		@height = height
		@cells = []

		height.times do |i|
			width.times do |j|
				cell = Cell.new(j, i)
				@cells.push(cell)
				north = find(j - 1, i)
				if !north.nil?
					cell.addNeighbor(north)
				end
				west = find(j, i - 1)
				if !west.nil?
					cell.addNeighbor(west)
				end
			end
		end

		# find(1, 1).connect(find(1, 2))

		# Build the dang thing
		root = @cells.sample
		root.visited = true
		path = [root]
		while path.length > 0
			cell = path[0]
			neighbor = cell.randNeighbor()
			if !neighbor.nil?
				cell.connect(neighbor)
				path.unshift(neighbor)
				neighbor.visited = true
			else
				path.shift
			end
		end
	end

	def find(x, y)
		@cells.find {|c| c.at?(x, y)}
	end

	def print()
		@height.times do |i|
			line = '|'
			@width.times do |j|
				line += find(j, i).print
			end
			p line
		end
	end
end