![](https://travis-ci.org/philipqnguyen/data-structures.svg?branch=master)

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
q.size #=> 3
q.to_s #=> "'cat', 'dog', 'lion'"
q.dequeue
q.to_s #=> "'dog', 'lion'"
```

## Hash Table

HashTable class will create a new hash table with a specified size as its initial parameter. You can use `set(word)` and `get(word)` to set and get a word to and from the table.

In this exercise, the key is the word itself and the value is the reversed word. To determine the placement of the word inside the table, each letters of the word are hashed into ordinal numbers, multiplied by base 127, and finally modulo by the size of the table. The resulting number will be the index of the cell of the hash table.

In order to prevent collision, when a word is placed into the cell, it will spawn a linked list where the word will reside at the head of the list. Subsequent words that fall into the same specific cell will be linked to that existing linked list.

``` ruby
ht = DataStructures::HashTable.new 10 # initialize the hash table with 10 cells
ht.set('hello') # This will hash the word and place into the table.
ht.get('hello') # will find the word 'hello' and return the reversed version.
```
