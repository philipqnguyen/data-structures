# Data Structures
module DataStructures
  # Main linked list class
  class LinkedList
    # Node
    class Node
      attr_accessor :value, :pointer, :reverse_word

      def self.count
        count = 0
        ObjectSpace.each_object(self) do |_i|
          count += 1
        end
      end

      def initialize(value, _pointer, reverse_word)
        @value = value
        @reverse_word = reverse_word
      end
    end

    def insert(value, reverse_word = false)
      if size > 0
        new_value = Node.new(value, nil, reverse_word)
        @tail.pointer = new_value
        @tail = new_value
      else
        @tail = Node.new(value, nil, reverse_word)
        @head = @tail
      end
    end

    def reverse
      prev = @head
      pivot = @head

      while prev.pointer != nil
        temp = pivot.pointer
        pivot.pointer = @head
        prev.pointer = temp
        @head = pivot
        pivot = temp
      end
      to_s
    end

    def size
      collect.count
    end

    def search(value)
      result = traverse(value)
      result.value == value ? result : nil
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

    def to_s
      csv_string = []
      collect.each do |value|
        if value.is_a? Integer
          csv_string << value
        else
          csv_string << "'#{value}'" if value.is_a? String
          csv_string << ":#{value}" if value.is_a? Symbol
        end
      end
      csv_string.join(', ')
    end

    private

    def traverse(value, find_before = false, _examining_value = @head)
      if find_before
        one_behind_current(value, @head)
      else
        current(value, @head)
      end
    end

    def collect
      collect_current(@tail, @head)
    end

    def one_behind_current(value, examining_value = @head)
      while value != examining_value.pointer.value && examining_value.pointer
        examining_value = examining_value.pointer
      end
      examining_value
    end

    def current(value, examining_value = @head, collect = false)
      return [] if collect && examining_value.nil?
      while value != examining_value.value && examining_value.pointer
        examining_value = examining_value.pointer
      end
      examining_value
    end

    def collect_current(value, examining_value = @head)
      return [] if examining_value.nil?
      collection = [examining_value.value]
      while value != examining_value.value && examining_value.pointer
        examining_value = examining_value.pointer
        collection << examining_value.value
      end
      collection
    end

    def swap_tail(value)
      before_match = traverse(value, true)
      @tail = before_match
      @tail.pointer = nil
    end

    def swap_middle(matched, value)
      before_match = traverse(value, true)
      after_match = matched.pointer
      before_match.pointer = after_match
    end

    def destroy(matched)
      matched.pointer = nil
      matched.value
    end
  end
end
