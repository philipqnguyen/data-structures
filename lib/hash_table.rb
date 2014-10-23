require 'linked_list.rb'
# Re-opening DataStructures
module DataStructures
  # Hash table
  class HashTable
    attr_reader :table, :size

    def initialize(size)
      @size = size
      @table = Array.new(size)
    end

    def hash(word)
      power = word.length - 1
      ordinals = word.split('').to_a.map(&:ord)
      unique_num = 0

      ordinals.each do |num|
        unique_num += num * 127**power
        power -= 1
      end

      unique_num
    end

    def set(word)
      index = hash(word) % size
      if @table[index].nil?
        @table[index] = LinkedList.new
        @table[index].insert(word, word.reverse)
      else
        @table[index].insert(word, word.reverse)
      end
      @table[index].search(word).reverse_word
    end

    def get(word)
      index = hash(word) % size
      @table[index].search(word).reverse_word
    end
  end
end
