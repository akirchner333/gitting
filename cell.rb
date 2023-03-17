class Cell
	attr_accessor :visited
	attr_reader :x, :y, :connections

	def initialize(x, y)
		@x = x;
		@y = y;
		@visited = false;
		@neighbors = [];
		@connections = {
			north: nil,
			east: nil,
			south: nil,
			west: nil,
		};
	end

	def addNeighbor(cell, sym = true)
		@neighbors.push(cell)
		if sym
			cell.addNeighbor(self, false)
		end
	end

	def connect(cell, direction = nil)
		if direction.nil?
			if cell.y == @y - 1
				@connections['north'] = cell
				cell.connect(self, 'south')
			elsif cell.y == @y + 1
				@connections['south'] = cell
				cell.connect(self, 'north')
			elsif cell.x == @x - 1
				@connections['west'] = cell
				cell.connect(self, 'east')
			elsif cell.x == @x + 1
				@connections['east'] = cell
				cell.connect(self, 'west')
			end
		else
			@connections[direction] = cell
		end
	end

	def randNeighbor
		@neighbors.filter { |n| !n.visited }.sample
	end

	def at?(x, y)
		x == @x && y == @y
	end

	def print
		pic = ''
		pic += @connections['south'].nil? ? '_' : ' '
		pic += @connections['east'].nil? ? '|' : ' '
		pic
	end
end