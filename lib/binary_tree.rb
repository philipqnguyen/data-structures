# re-open DataStructures
module DataStructures
  Tree = Struct.new(:value, :left, :right)

  # BinaryTree
  class BinaryTree
    def insert(value)
      if @current_tree
        add_leaf value
      else
        new_root value
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
      return current_tree if match current_tree, value

      if current_tree
        left = search(value, search_type, current_tree.left)
        right = search(value, search_type, current_tree.right)
        root = current_tree if current_tree.value == value
      end

      traverse(search_type, root, left, right)
    end

    private

    def add_leaf(value)
      tree = Tree.new
      tree.value = value
      if @current_tree.left.nil?
        @current_tree.left = tree
      elsif @current_tree.right.nil?
        @current_tree.right = tree
      else
        return 'This tree is full'
      end
    end

    def new_root(value)
      @root = Tree.new
      @root.value = value
      @current_tree = @root
    end

    def traverse(search_type, root, left, right)
      if search_type == 'pre_o'
        traverse_via_pre_order(root, left, right)
      elsif search_type == 'in_o'
        traverse_via_in_order(left, root, right)
      else
        traverse_via_post_order(left, right, root)
      end
    end

    def traverse_via_pre_order(root, left, right)
      root || left || right
    end

    def traverse_via_in_order(left, root, right)
      left || root || right
    end

    def traverse_via_post_order(left, right, root)
      left || right || root
    end

    def match(current_tree, value)
      if current_tree && current_tree.value == value
        @current_tree = current_tree
        return true
      else
        return false
      end
    end
  end

  # Apple Restructuring Class
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

    def search(value, search_type = 'pre_o', current_tree = @root)
      puts current_tree.value if current_tree
      super
    end
  end
end
