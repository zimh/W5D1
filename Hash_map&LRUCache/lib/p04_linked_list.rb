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
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail 
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    if @head.next == @tail && @tail.prev == @head
      return true 
    else
      false
    end
  end

  def get(key)
  end

  def include?(key)
    current = @head.next 
    while current.next != nil
      if current.key == key
        return true 
      end
      current = current.next
    end
    false
  end

  def append(key, val)
    node = Node.new(key, val)
    # right_node = @tail.next
    # node.next = @tail
    # node.prev = right_node
    # @tail.prev = node 
    # right_node.next = node
    @tail.prev = node
    node.next = @tail
    @head.next = node
    node.prev = @head

  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
