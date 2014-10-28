require 'spec_helper'
require 'deduplicate_doubly_linked_list.rb'

describe 'Doubly linked list' do
  before do
    @list = List.new(200)
  end

  it 'should have 200 nodes' do
    @list.size.must_equal 200
  end

  it 'should not have duplicates' do
    deduplicated = @list.deduplicate.sort
    is_deduplicated = true
    deduplicated.each_with_index do |num, index|
      next if index == 0
      is_deduplicated = false if deduplicated[index - 1] == num
    end
    is_deduplicated.must_equal true
  end
end
