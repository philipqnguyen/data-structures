module DataStructures
  class LinkedList
    class Node
      attr_accessor :value, :pointer

      def self.count
        count = 0
        ObjectSpace.each_object(self) do |i|
          count += 1
        end
      end

      def initialize (value, pointer)
        @value = value
        pointer = pointer
      end
    end

    def insert(value)
      if self.size > 0
        new_value = Node.new(value, nil)
        @tail.pointer = new_value
        @tail = new_value
      else
        @tail = Node.new(value, nil)
        @head = @tail
      end
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
      else
        before_match = traverse(value, true)
        after_match = matched.pointer
        before_match.pointer = after_match
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
      csv_string.join(", ")
    end

    private

    def traverse(value, find_before = false, examining_value = @head)
      if find_before
        one_behind_current(value, @head)
      else
        current(value, @head)
      end
    end

    def collect
      current(@tail, @head, true)
    end

    def one_behind_current(value, examining_value = @head)
      while value != examining_value.pointer.value && examining_value.pointer
        examining_value = examining_value.pointer
      end
      examining_value
    end

    def current(value, examining_value = @head, collect = false)
      return [] if collect && examining_value.nil?
      collection = [examining_value.value] if collect
      while value != examining_value.value && examining_value.pointer
        examining_value = examining_value.pointer
        collection << examining_value.value if collect
      end
      collect ? collection : examining_value
    end

    def destroy(matched)
      matched.pointer = nil
      matched.value
    end
  end
end
