module DataStructures
  Tree = Struct.new(:value, :left, :right)

  class BinaryTree
    def insert(value)
      if @current_tree
        tree = Tree.new
        tree.value = value
        if @current_tree.left.nil?
          @current_tree.left = tree
        elsif @current_tree.right.nil?
          @current_tree.right = tree
        else
          return 'This tree is full'
        end
      else
        @root = Tree.new
        @root.value = value
        @current_tree = @root
      end
    end

    def assign(parent, child)
      search parent
      insert child
    end

    def pre_order_search(value)
      search(value)
    end

    def in_order_search(value)
      search(value, 'in_o')
    end

    def post_order_search(value)
      search(value, 'post_o')
    end

    def search(value, search_type = 'pre_o', current_tree = @root)
      if current_tree && current_tree.value == value
        @current_tree = current_tree
        return current_tree
      end

      left = search(value, search_type, current_tree.left) if current_tree
      right = search(value, search_type, current_tree.right) if current_tree
      root = current_tree if current_tree.value == value if current_tree

      if search_type == 'pre_o'
        root || left || right
      elsif search_type == 'in_o'
        left || root || right
      else
        left || right || root
      end
    end
  end

  class AppleOrg < BinaryTree
    def initialize
      insert 'tim'
      assign 'tim', 'jony'
      assign 'tim', 'phil'
      assign 'phil', 'craig'
      assign 'phil', 'eddie'
      assign 'jony', 'dan'
      assign 'jony', 'katie'
      assign 'katie', 'peter'
      assign 'katie', 'andrea'
    end
  end
end
