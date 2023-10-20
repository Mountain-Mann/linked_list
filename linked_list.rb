# frozen_string_literal: true

# Linked list class
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def create_node(value = nil, next_node = nil)
    Node.new(value, next_node)
  end

  def append(value)
    if @head.nil?
      self.head = Node.new(value, nil)
    else
      last_node = @head
      last_node = last_node.next_node until last_node.next_node.nil?
      last_node.next_node = Node.new(value, nil)
    end
  end

  def prepend(value)
    if @head.nil?
      self.head = Node.new(value, nil)
    else
      old_head = head
      @head = Node.new(value, old_head)
    end
  end

  def remove(value)
    return if head.nil?

    node = head
    self.head = node.next_node if node.value.eql?(value)
  end

  def size
    return if head.nil?

    node = head
    node_count = 0
    while node
      node_count += 1
      node = node.next_node
    end
    puts node_count
  end

  def head_val
    return if head.nil?

    puts head.value
  end

  def tail_val
    return if head.nil?

    node = head
    while node
      puts node.value if node.next_node.nil?

      node = node.next_node
    end
  end

  def at(index)
    return if head.nil?

    node = head
    index_count = 0

    while node
      if index_count == index
        puts "#{node.value} [#{index_count}]"
        return
      end
      index_count += 1
      node = node.next_node
    end
  end

  def pop
    return if head.nil?

    if head.next_node.nil?
      value = head.value
      self.head = nil
      return value
    end

    node = head
    node = node.next_node while node&.next_node&.next_node
    value = node.next_node.value
    node.next_node = nil
    puts value
  end

  def find(value)
    return if head.nil?

    index = 0
    node = @head
    while node
      return puts index if node.value == value

      index += 1
      node = node.next_node
    end
  end

  def contains?(value)
    node = @head
    while node
      return puts true if node.value == value

      node = node.next_node
    end
    false
  end

  def last_node?(node)
    return true if node.next_node.nil?

    false
  end

  def to_s(node = head, string = '')
    return string += "( #{node.value} ) -> nil" if last_node?(node)

    string += "( #{node.value} ) -> "
    puts to_s(node.next_node, string)
  end

  # Node def
  class Node
    attr_accessor :value, :next_node

    private

    def initialize(value = nil, next_node = nil)
      self.value = value
      self.next_node = next_node
    end
  end
end

ll = LinkedList.new
ll.append(55)
ll.append(56)
ll.append(57)
ll.append(51)
ll.append(552)
ll.append(535)
ll.prepend(5)
# ll.tail_val
ll.head_val
ll.size
ll.contains?(51)
ll.find(552)
ll.pop
ll.to_s
