require 'linked_list.rb'
# re-open DataStructures
module DataStructures
  # Error for Queue
  class QueueEmptyError < RuntimeError; end
  # Queue inherits from LinkedList
  class Queue < LinkedList
    def enqueue(value)
      insert(value)
    end

    def dequeue
      if @head.nil?
        fail QueueEmptyError, 'Queue cannot be empty'
      else
        remove(@head.value)
      end
    end
  end
end
