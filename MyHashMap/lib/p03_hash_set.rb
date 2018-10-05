class HashSet
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if self[key].include?(key)
    resize! if count == @store.length

    self[key] << key
    self.count += 1
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      self.count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
      @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    holder_arr = @store.flatten

    @store = Array.new(count*2) { Array.new }

    holder_arr.each do |ele|
        @store[ele % (count * 2)] << ele
    end
    #
    # @store
  end
end
