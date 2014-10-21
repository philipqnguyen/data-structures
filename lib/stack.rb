require 'linked_list.rb'
# re-open DataStructures
module DataStructures
  # Error for Stack
  class StackEmptyError < RuntimeError; end
  # Stack inherits from LinkedList
  class Stack < LinkedList
    def push(value)
      insert(value)
    end

    def pop
      if @tail.nil?
        fail StackEmptyError, 'Stack cannot be empty'
      else
        remove(@tail.value)
      end
    end
  end
end
