require 'linked_list.rb'
# re-open DataStructures
module DataStructures
  # Stack inherits from LinkedList
  class Stack < LinkedList
    def push(value)
      insert(value)
    end

    def pop
      if @tail.nil?
        raise NoMethodError, 'Stack cannot be empty'
      else
        message = @tail.value
        remove(search(@tail.value))
        message
      end
    end
  end
end
