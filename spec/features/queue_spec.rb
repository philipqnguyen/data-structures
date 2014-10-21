require 'spec_helper'
require 'queue.rb'
include DataStructures

describe 'Queue' do
  before do
    @q = DataStructures::Queue.new
    @q.enqueue 'cat'
    @q.enqueue 'dog'
    @q.enqueue 'mouse'
  end

  it 'should enqueue' do
    @q.enqueue 'rat'

    @q.to_s.must_equal "'cat', 'dog', 'mouse', 'rat'"
  end

  it 'should dequeue' do
    @q.dequeue.must_equal 'cat'
    @q.to_s.must_equal "'dog', 'mouse'"
  end

  it 'should return the size of the queue' do
    @q.size.must_equal 3
  end
end

describe 'Empty Queue' do
  it 'should return an error' do
    q = DataStructures::Queue.new

    proc { q.dequeue }.must_raise QueueEmptyError
  end
end
