class Node
	attr_accessor :value, :nexxt, :previous
	def initialize(value, nexxt, previous)
		@value = value
		@nexxt = nexxt
		@previous = previous
	end
end

class LinkedList
	attr_accessor :head, :size
	def initialize
		@head = nil
		@size = 0
	end

	def insert(value, nexxt = nil, previous = nil)
		if @head == nil
			@head = Node.new(value, nexxt, previous) 
		else
			@head.previous = Node.new(value, nexxt, previous)
			@head.previous.nexxt = @head
			@head = @head.previous
		end
		@size += 1
	end

	def remove(node)
		counter = 1
		if (node == 1 && @size == 1)
			@head = nil
		elsif (node == 1 && @size > 1)
			@head = @head.nexxt
			@head.previous = nil
		elsif(node == 2 && @size == 2)
			@head.nexxt = nil
		else
			current = @head
			while(current && counter != node)
				current = current.nexxt
				counter += 1
			end
				if(node == counter)
					if current.nexxt == nil
						current.previous.nexxt = nil
					else
					current.previous.nexxt = current.nexxt
					current.nexxt.previous = current.previous
				end
				end
		end
		@size -= 1
	end

	def dedupe_array
		array = []
		counter = 1
		current = @head
			while(current && counter <= @size)
				if array.include?(current.value)
					self.remove(counter)
					current = current.nexxt
				else
				array << current.value
				current = current.nexxt
				counter += 1
				end
			end
	end

	def dedupe
		pointer1 = @head
    counter = 1
    while (pointer1 && counter <= @size)
      pointer2 = pointer1.nexxt
      counter2 = counter + 1
      while (pointer2 && counter2 <= @size) 
        if pointer1.value == pointer2.value
          self.remove(counter2)
          pointer2 = pointer2.nexxt
        else
          pointer2 = pointer2.nexxt
          counter2 += 1
        end
      end
      pointer1 = pointer1.nexxt
      counter += 1
    end
	end

  def list
    sort = []
    current = @head
    while current
      sort << current.value
      current = current.nexxt
    end
    sort
  end
end

thing = LinkedList.new
100.times {thing.insert(rand(1..10))}