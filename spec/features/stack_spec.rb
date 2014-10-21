require 'spec_helper'
require 'linked_list.rb'
require 'stack.rb'
include DataStructures

describe 'Stack' do
  before do
    @stack = Stack.new
    @stack.push 'bob'
    @stack.push 'cat'
  end

  it 'should push a new element to the stack' do
    @stack.push 'hello'

    @stack.to_s.must_equal "'bob', 'cat', 'hello'"
  end

  it 'should pop an existing element out of the stack' do
    @stack.pop.must_equal 'cat'

    @stack.to_s.must_equal "'bob', 'cat'"
  end
end

describe 'Empty Stack' do
  it 'should raise an exception if popping on an empty stack' do
    stack = Stack.new

    proc { stack.pop }.must_raise NoMethodError
  end
end
