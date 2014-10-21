# Data Structures

By [Philip Q Nguyen](https://github.com/philipqnguyen)

A repository for data structures.

## Included Data Structures

- Singly Linked List

## Usage

`include DataStructures`

### Singly Linked List

The following methods are available:
- `#insert(data)`
- `#search(data)`
- `#size`
- `#remove(data)`
- `#to_s` will print a CSV compatible string of all the data values.

``` ruby
linky = LinkedList.new
linky.insert 'dog'
linky.insert 2
linky.insert :cat

linky.to_s #=> "'dog', 2, :cat"

linky.size #=> 3

linky.search :cat #=> #<DataStructures::LinkedList::Node:0x007f81a3370308 @value=:cat>

linky.remove 2

linky.to_s #=> "'dog', :cat"
```

### Stack

Stack inherits from LinkedList and in addition to the inherited methods, the following methods are also available:

- #push(data)
- #pop

``` ruby
stack = Stack.new
stack.push 'o'
stack.push 'p'
stack.push 'm'
stack.to_s #=> "'o', 'p', 'm'"
stack.pop
stack.to_s #=> "'o', 'p'"
```
### Queue

Queue inherits from LinkedList and in addition to the inherited methods, the following methods are also available:

``` ruby
q = DataStructures::Queue.new
q.enqueue 'cat'
q.enqueue 'dog'
q.enqueue 'lion'
q.to_s #=> "'cat', 'dog', 'lion'"
q.dequeue
q.to_s #=> "'dog', 'lion'"
```
