require 'linked_list.rb'
require 'hash_table.rb'
include DataStructures

# Re-open hastable
class NonDupHashTable < HashTable
  def check(integer)
    index = hash(integer) % size
    if @table[index].nil?
      @table[index] = integer
      return false
    else
      return true
    end
  end

  def hash(word)
    power = word.to_s.length - 1
    ordinals = word.to_s.split('').to_a.map(&:ord)
    unique_num = 0

    ordinals.each do |num|
      unique_num += num * 127**power
      power -= 1
    end

    unique_num
  end
end

# new class List
class List
  # New class node
  class Node
    attr_accessor :value, :prev, :pointer

    def initialize(value, prev, pointer)
      @value = value
      @prev = prev
      @pointer = pointer
    end
  end

  attr_reader :initial_count

  def initialize(initial_count)
    unless initial_count.is_a? Integer
      fail TypeError, 'Argument can only take an integer.'
    end

    n = 0
    while n < initial_count
      insert rand(100)
      n += 1
    end
  end

  def insert(value)
    if size > 0
      new_node = Node.new(value, @tail, nil)
      @tail.pointer = new_node
      @tail = new_node
    else
      @tail = Node.new(value, nil, nil)
      @head = @tail
    end
  end

  def deduplicate
    non_dup = NonDupHashTable.new 100

    current_node = @head
    mark_remove = non_dup.check current_node.value
    while current_node.pointer
      current_node = current_node.pointer
      remove current_node.prev.value if mark_remove
      mark_remove = non_dup.check current_node.value
    end
    remove current_node.value if mark_remove
    collect
  end

  def collect
    current_node = @head
    box = [current_node.value]
    while current_node.pointer
      current_node = current_node.pointer
      box << current_node.value
    end
    box
  end

  def remove(value, current_node = @head)
    match = @head if @head.value == value
    while current_node.pointer
      current_node = current_node.pointer
      match = current_node if current_node.value == value
      break if match
    end
    swap_and_destroy match if match
  end

  def size
    @head ? n = 1 : n = 0

    current_node = @head
    while @head && current_node.pointer
      current_node = current_node.pointer
      n += 1
    end
    n
  end

  def swap_and_destroy(match)
    swap match if match
    destroy match if match
  end

  def destroy(match)
    match.prev = nil
    match.pointer = nil
  end

  def swap(match)
    if match.pointer.nil?
      @tail = match.prev
    elsif match.prev.nil?
      @head = match.pointer
    end
    match.prev.pointer = match.pointer if match.prev
    match.pointer.prev = match.prev if match.pointer
  end
end
