class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next = self.next
    self.next.prev  = self.prev
  end

end

class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
    # @list = [@head, @tail]
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail

  end

  def get(key)
    first_node = @head.next
    until first_node == tail
      if first_node.key == key
        return first_node.val 
      else
        first_node = first_node.next
      end
    end
    return nil
  end

  def include?(key)
  end

  def append(key, val)
    newnode = Node.new(key, val)
    newnode.prev = @tail.prev
    newnode.next = @tail
    @tail.prev.next = newnode
    @tail.prev = newnode
  end

  def update(key, val)
    self.each

  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end