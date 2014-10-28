require 'linked_list.rb'
require 'hash_table.rb'
include DataStructures

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

class List < LinkedList
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
    if !initial_count.is_a? Integer
      fail TypeError, 'Argument can only take an integer.'
    end

    n = 0
    while n < initial_count do
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
    examining_value = @head
    non_dup = NonDupHashTable.new 100
    mark_for_removal = false
    while examining_value.pointer
      examining_value = examining_value.pointer
      remove(examining_value.prev.value) if mark_for_removal
      mark_for_removal = non_dup.check examining_value.value
    end
    remove examining_value.value if mark_for_removal
    collect
  end

  def remove(value)
    matched = traverse value
    return nil if matched.value != value
    if @head.value == value
      @head = matched.pointer
    elsif matched.value == @tail.value
      swap_tail value
    else
      swap_middle(matched, value)
    end
    destroy matched
  end

  def to_a
    collect
  end

  private

  def swap_middle(matched, value)
    before_match = traverse(value, true)
    after_match = matched.pointer
    before_match.pointer = after_match
    after_match.prev = before_match
  end

  def collect
    collect_current(@tail, @head)
  end

  def collect_current(value, examining_value = @head)
    super
  end

  def destroy(matched)
    matched.pointer = nil
  end
end
