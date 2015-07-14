class Node
	attr_accessor :value, :parent, :one, :two, :three, :four, :five, :six, :seven, :eight

	def initialize(value, parent = nil, one = nil, two = nil, three = nil, four = nil, five = nil, six = nil, seven = nil, eight = nil)
		@value = value 
		@parent = parent
		@one = one
		@two = two
		@three = three
		@four = four
		@five = five
		@six = six
		@seven = seven
		@eight = eight
	end
end

class Tree
	attr_accessor :position, :goal, :root

	def initialize(position, goal)
		@position = position
		@goal = goal
		@root = Node.new(position)
		knight_moves(position, goal)
	end

	def possible_moves_from(position)
		moves = {1 => [], 2 => [], 3 => [],4 => [], 5 => [], 6 => [], 7 => [], 8 => []}

		moves[1] << (position[0] - 2) if (position[0] - 2) >= 0
		moves[2] << (position[0] - 2) if (position[0] - 2) >= 0
		moves[3] << (position[0] - 1) if (position[0] - 1) >= 0
		moves[4] << (position[0] - 1) if (position[0] - 1) >= 0
		moves[5] << (position[0] + 1) if (position[0] + 1) <= 7
		moves[6] << (position[0] + 1) if (position[0] + 1) <= 7
		moves[7] << (position[0] + 2) if (position[0] + 2) <= 7
		moves[8] << (position[0] + 2) if (position[0] + 2) <= 7
		moves[1] << (position[1] - 1) if (position[1] - 1) >= 0
		moves[7] << (position[1] - 1) if (position[1] - 1) >= 0
		moves[2] << (position[1] + 1) if (position[1] + 1) <= 7
		moves[8] << (position[1] + 1) if (position[1] + 1) <= 7
		moves[3] << (position[1] - 2) if (position[1] - 2) >= 0
		moves[5] << (position[1] - 2) if (position[1] - 2) >= 0
		moves[4] << (position[1] + 2) if (position[1] + 2) <= 7
		moves[6] << (position[1] + 2) if (position[1] + 2) <= 7

		final = []
		moves.values.each do |value|
			final << value if value.length == 2
		end
		return final
	end

	def insert(value, current_node = root)
		if current_node.one.nil?
			current_node.one = Node.new(value, current_node)
		elsif current_node.two.nil?
			current_node.two = Node.new(value, current_node)
		elsif current_node.three.nil?
			current_node.three = Node.new(value, current_node)
		elsif current_node.four.nil?
			current_node.four = Node.new(value, current_node)
		elsif current_node.five.nil?
			current_node.five = Node.new(value, current_node)
		elsif current_node.six.nil?
			current_node.six = Node.new(value, current_node)
		elsif current_node.seven.nil?
			current_node.seven = Node.new(value, current_node)
		else
			current_node.eight = Node.new(value, current_node)
		end
	end
	


	def knight_moves(position, goal)
		queue = [root]
		until queue.empty?
			current_node = queue.shift
			return current_node.value if current_node.value == goal
			array = possible_moves_from(current_node.value)
			array.each do |move|

				if move == goal
					@array = [move]
					solution = path(current_node).reverse!
					puts "You made it in #{solution.length} moves, path: #{solution}"
					return move
				end

				insert(move, current_node)
			end
			queue << current_node.one unless current_node.one.nil?
			queue << current_node.two unless current_node.two.nil?
			queue << current_node.three unless current_node.three.nil?
			queue << current_node.four unless current_node.four.nil?
			queue << current_node.five unless current_node.five.nil?
			queue << current_node.six unless current_node.six.nil?
			queue << current_node.seven unless current_node.seven.nil?
			queue << current_node.eight unless current_node.eight.nil?
		end
	end

	def path(node)
		@array << node.value
		return @array if node.value == root.value 
		path(node.parent)
	end
end

puts "[0,0] -> [6,6]"
tree = Tree.new([0,0], [6,6])
puts "[6,6] -> [0,0]"
tree = Tree.new([6,6], [0,0])
puts "[4,7] -> [2,4]"
tree = Tree.new([4,7], [2,4])
puts "[8,8] -> [1,1]"
tree = Tree.new([8,8], [1,1])



