require 'spec_helper'
require 'linked_list.rb'
require 'stack.rb'
include DataStructures

describe 'Linked List' do
  before do
    @linky = LinkedList.new
    @linky.insert 'cat'
    @linky.insert 2
    @linky.insert :man
    @linky.insert 'dog'
    @linky.insert 3
    @linky.insert :cow
  end

  it 'should insert new data and search for it' do
    @linky.insert 'bat'
    @linky.insert :croc
    @linky.insert 5

    @linky.search('bat').value.must_equal 'bat'
    @linky.search(:croc).value.must_equal :croc
    @linky.search(5).value.must_equal 5
  end

  it 'should count the number of nodes' do
    @linky.size.must_equal 6
  end

  it 'should remove a node somewhere in the middle' do
    @linky.remove 3

    @linky.search(3).must_equal nil
  end

  it 'should remove the last node' do
    @linky.remove(:cow)

    @linky.search(:cow).must_equal nil
  end

  it 'should remove the first node' do
    @linky.remove('cat')

    @linky.search('cat').must_equal nil
  end

  it 'should return a CSV compatible string' do
    @linky.to_s.must_equal "'cat', 2, :man, 'dog', 3, :cow"
  end
end
