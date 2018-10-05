class Node
  attr_accessor :key, :val, :next, :prev

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

require "byebug"
class LinkedList
# attr_accessor :head, :tail
include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
    # debugger
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    self.first == @tail
  end

  def get(key)
    self.each do |node|
      if node.key == key
        return node.val
      end
    end

  end

  def include?(key)
    self.any?{|node| node.key == key}

  end

  def append(key, val)

    node = Node.new(key, val)
    # debugger

    node.prev = last
    self.last.next = node
    @tail.prev = node
    node.next = @tail

    #
    # @tail.next = node
    # node.prev = @tail

  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
      end
    end

  end

  def remove(key)
    cur_node = nil
    self.each do |node|
      if node.key == key
       cur_node = node
     end
   end

    cur_node.prev.next = cur_node.next
    cur_node.next.prev = cur_node.prev

  end

  def each(&prc)
    #take a block,
    cur_node = self.first

    until cur_node == @tail
      prc.call(cur_node)
      cur_node = cur_node.next
    end
  end


  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
