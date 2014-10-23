require 'spec_helper'
require 'hash_table.rb'
include DataStructures

describe 'Hash table' do
  before do
    @hash = HashTable.new 10
  end

  it 'should hash a word' do
    @hash.hash('hi').must_equal 13_313
  end

  it 'should set a word into the hast table and return itself' do
    @hash.set('oranges').must_equal 'segnaro'
  end

  it 'should get back the value' do
    @hash.set('banana').must_equal 'ananab'
    @hash.get('banana').must_equal 'ananab'
  end

  it 'should fail if argument is not a string' do
    proc { @hash.set(15) }.must_raise TypeError
  end
end

describe 'Hash the whole dictionary' do
  before do
    file = File.new('dict')
    @dict = file.readlines.map(&:strip)

    @hash = HashTable.new @dict.count

    @dict.each do |word|
      @hash.set(word)
    end
  end

  it 'should retrieve all of the reversed words in the hash table' do
    @dict.each do |word|
      @hash.get(word).must_equal word.reverse
    end
  end
end
