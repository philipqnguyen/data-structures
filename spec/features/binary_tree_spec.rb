require 'spec_helper'
require 'binary_tree.rb'
include DataStructures

describe 'Insert into Binary Tree' do
  before do
    @bt = BinaryTree.new
  end

  it 'should insert new data' do
    @bt.insert('tim').must_be_instance_of Tree
    @bt.insert('jon').must_be_instance_of Tree
    @bt.insert('bob').must_be_instance_of Tree
  end

  it 'should fail if trying to insert more than two childs' do
    @bt.insert('tim').must_be_instance_of Tree
    @bt.insert('jon').must_be_instance_of Tree
    @bt.insert('bob').must_be_instance_of Tree
    @bt.insert('aimee').must_equal 'This tree is full'
  end
end

describe 'Assign child to parent' do
  before do
    @bt = BinaryTree.new
    @bt.insert('tim').must_be_instance_of Tree
    @bt.insert('jon').must_be_instance_of Tree
    @bt.insert('bob').must_be_instance_of Tree
  end

  it 'should assign leaves to a parent tree' do
    @bt.assign('jon', 'rolf').must_be_instance_of Tree
    @bt.assign('jon', 'jen').must_be_instance_of Tree
  end
end
