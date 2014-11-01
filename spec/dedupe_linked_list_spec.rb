require 'minitest/autorun'
require 'minitest/spec'
require 'dedupe_linked_list'

describe LinkedList do
	before do
	@array = [3, 5, 1, 5, 2, 6, 3, 8, 10, 6, 2, 10, 100]
	@ll = LinkedList.new
	@array.each {|i| @ll.insert(i)}
	end

	it "should return deduped linked list using an array" do
		@ll.dedupe_array
		@ll.list.must_equal [100, 10, 2, 6, 8, 3, 5, 1]
	end

	it "should return deduped linked list without using an array" do
		@ll.dedupe
		@ll.list.must_equal [100, 10, 2, 6, 8, 3, 5, 1]
	end
end