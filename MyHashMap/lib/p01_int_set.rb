require "byebug"

class MaxIntSet
  attr_reader :max
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true

  end

  def remove(num)
    is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true

  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num > max || num < 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }

  end

  def insert(num)
    @store[num % num_buckets] += [num]

  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if self[num].include?(num)
    resize! if count == @store.length

    self[num] << num
    self.count += 1
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      self.count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    #holder array = current array, make new array double
    #modulo each of the old items with the new array's length
    # debugger
    holder_arr = @store.flatten

    @store = Array.new(count*2) { Array.new }

    holder_arr.each do |ele|
        @store[ele % (count * 2)] << ele
    end
    #
    # @store
  end
end
